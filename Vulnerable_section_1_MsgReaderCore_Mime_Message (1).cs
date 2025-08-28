         if (!file.Exists)
             throw new FileNotFoundException("Cannot load message from non-existent file", file.FullName);
 
        return Load(file.OpenRead());
     }
 
     /// <summary>