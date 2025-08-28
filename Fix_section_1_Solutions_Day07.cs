     private void ChangeDirectory(string directory)
     {
         if (directory == "/") CurrentPath = "/";
        else if (directory == "..") CurrentPath = CurrentPath[..(CurrentPath[..^1].LastIndexOf('/') + 1)];
         else CurrentPath += $"{directory}/";
     }
     