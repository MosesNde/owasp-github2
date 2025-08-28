         if (!file.Exists)
             throw new FileNotFoundException("Cannot load message from non-existent file", file.FullName);
 
        using (var fileStream = file.OpenRead())
            return Load(fileStream);
     }
 
     /// <summary>