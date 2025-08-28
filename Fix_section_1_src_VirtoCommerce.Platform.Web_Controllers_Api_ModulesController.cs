                 return BadRequest($"Expected a multipart request, but got {Request.ContentType}");
             }
 
            var targetFilePath = await UploadFile(Request, Path.GetFullPath(_platformOptions.LocalUploadFolderPath));
            if (targetFilePath is null)
             {
                return BadRequest("Cannot read file");
             }
 
            var manifest = await LoadModuleManifestFromZipArchive(targetFilePath);
            if (manifest is null)
            {
                return BadRequest("Cannot read module manifest");
            }

            var module = AbstractTypeFactory<ManifestModuleInfo>.TryCreateInstance();
            module.LoadFromManifest(manifest);
            var existingModule = _externalModuleCatalog.Modules.OfType<ManifestModuleInfo>().FirstOrDefault(x => x.Equals(module));

            if (existingModule != null)
            {
                module = existingModule;
            }
            else
            {
                //Force dependency validation for new module
                _externalModuleCatalog.CompleteListWithDependencies([module]).ToList().Clear();
                _externalModuleCatalog.AddModule(module);
            }

            module.Ref = targetFilePath;
            var result = new ModuleDescriptor(module);

            return Ok(result);
        }

        private static async Task<string> UploadFile(HttpRequest request, string uploadFolderPath)
        {
            var boundary = MultipartRequestHelper.GetBoundary(MediaTypeHeaderValue.Parse(request.ContentType), _defaultFormOptions.MultipartBoundaryLengthLimit);
            var reader = new MultipartReader(boundary, request.Body);
             var section = await reader.ReadNextSectionAsync();
 
            if (section == null)
             {
                return null;
            }
 
            if (!ContentDispositionHeaderValue.TryParse(section.ContentDisposition, out var contentDisposition) ||
                !MultipartRequestHelper.HasFileContentDisposition(contentDisposition))
            {
                return null;
            }
 
            var fileName = Path.GetFileName(contentDisposition.FileName.Value);
            if (string.IsNullOrEmpty(fileName))
            {
                return null;
            }
 
            if (!Directory.Exists(uploadFolderPath))
            {
                Directory.CreateDirectory(uploadFolderPath);
            }

            var targetFilePath = Path.Combine(uploadFolderPath, fileName);

            await using var targetStream = System.IO.File.Create(targetFilePath);
            await section.Body.CopyToAsync(targetStream);

            return targetFilePath;
        }

        private static async Task<ModuleManifest> LoadModuleManifestFromZipArchive(string path)
        {
            ModuleManifest manifest = null;

            try
            {
                await using var packageStream = System.IO.File.Open(path, FileMode.Open);
                using var package = new ZipArchive(packageStream, ZipArchiveMode.Read);

                var entry = package.GetEntry("module.manifest");
                if (entry != null)
                 {
                    await using var manifestStream = entry.Open();
                    manifest = ManifestReader.Read(manifestStream);
                 }
             }
            catch
            {
                // Suppress any exceptions
            }
 
            return manifest;
         }
 
         /// <summary>