             string imageName = employee.ImageName?.Replace("..", string.Empty).Trim() ?? string.Empty;
             if (imageName is { Length: > 0 })
             {
                string path = Path.GetFullPath($"{_webHostEnvironment.WebRootPath}\\uploads\\{employee.ImageName}");
                if (!path.StartsWith(_webHostEnvironment.WebRootPath))
                {
                    return BadRequest();
                }

                 using (FileStream fileStream = System.IO.File.Create(path))
                 {
                     fileStream.Write(employee.ImageContent, 0, employee.ImageContent.Length);