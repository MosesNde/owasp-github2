     private void ChangeDirectory(string directory)
     {
         if (directory == "/") CurrentPath = "/";
        else if (directory == "..") CurrentPath = CurrentPath.Substring(0, CurrentPath.LastIndexOf('/') - 1);
         else CurrentPath += $"{directory}/";
     }
     