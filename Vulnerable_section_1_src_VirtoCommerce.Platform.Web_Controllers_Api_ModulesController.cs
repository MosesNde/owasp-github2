                 return BadRequest($"Expected a multipart request, but got {Request.ContentType}");
             }
 
            var uploadPath = Path.GetFullPath(_platformOptions.LocalUploadFolderPath);
            if (!Directory.Exists(uploadPath))
             {
                Directory.CreateDirectory(uploadPath);
             }
 
            ModuleDescriptor result = null;
            string targetFilePath = null;
            var boundary = MultipartRequestHelper.GetBoundary(MediaTypeHeaderValue.Parse(Request.ContentType), _defaultFormOptions.MultipartBoundaryLengthLimit);
            var reader = new MultipartReader(boundary, HttpContext.Request.Body);
             var section = await reader.ReadNextSectionAsync();
 
            if (section != null)
             {
                var hasContentDispositionHeader = ContentDispositionHeaderValue.TryParse(section.ContentDisposition, out var contentDisposition);
 
                if (hasContentDispositionHeader)
                {
                    if (MultipartRequestHelper.HasFileContentDisposition(contentDisposition))
                    {
                        var fileName = contentDisposition.FileName.Value;
                        targetFilePath = Path.Combine(uploadPath, fileName);
 
                        using (var targetStream = System.IO.File.Create(targetFilePath))
                        {
                            await section.Body.CopyToAsync(targetStream);
                        }
 
                    }
                }
                using (var packageStream = System.IO.File.Open(targetFilePath, FileMode.Open))
                using (var package = new ZipArchive(packageStream, ZipArchiveMode.Read))
                 {
                    var entry = package.GetEntry("module.manifest");
                    if (entry != null)
                    {
                        using (var manifestStream = entry.Open())
                        {
                            var manifest = ManifestReader.Read(manifestStream);
                            var module = AbstractTypeFactory<ManifestModuleInfo>.TryCreateInstance();
                            module.LoadFromManifest(manifest);
                            var alreadyExistModule = _externalModuleCatalog.Modules.OfType<ManifestModuleInfo>().FirstOrDefault(x => x.Equals(module));
                            if (alreadyExistModule != null)
                            {
                                module = alreadyExistModule;
                            }
                            else
                            {
                                //Force dependency validation for new module
                                _externalModuleCatalog.CompleteListWithDependencies(new[] { module }).ToList().Clear();
                                _externalModuleCatalog.AddModule(module);
                            }
                            module.Ref = targetFilePath;
                            result = new ModuleDescriptor(module);
                        }
                    }
                 }
             }
 
            return Ok(result);
         }
 
         /// <summary>