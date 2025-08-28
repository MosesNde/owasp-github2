 ﻿using System;
using System.Collections.Generic;
 using System.Globalization;
 using System.IO;
 using System.Linq;
     }
 #endif
 
    /// <summary>
    /// Create and write arguments to a new file
    /// </summary>
    /// <param name="arguments">The arguments that should be written to a file</param>
    /// <returns>The name of the file created</returns>
    internal static string CreateAndWriteArgumentsToNewTempFile(IEnumerable<string> arguments)
    {
        string fileName = Path.Combine(Path.GetTempPath(), $"openria-codegen-{DateTime.Now:yyyyMMdd-HHmmss-fff}.tmp");

        try
        {
            WriteContentsToNewFile(fileName, arguments);
        }
        catch (IOException)
        {
            // The file could already exist, which would throw an IOExcpetion
            // Add random file name to the file name and try again
            fileName += Path.GetRandomFileName();
            WriteContentsToNewFile(fileName, arguments);
        }

        return fileName;
    }

    /// <summary>
    /// Create a new file with <see cref="FileShare.Read"/> and write the contents to it
    /// </summary>
    /// <param name="filePath">The path to the file to be created</param>
    /// <param name="contents">The contents that should be written to the file</param>
    internal static void WriteContentsToNewFile(string filePath, IEnumerable<string> contents)
    {
        using (var fileStream = new FileStream(filePath, FileMode.CreateNew, FileAccess.Write, FileShare.Read))
        using (var writer = new StreamWriter(fileStream))
        {
            foreach (string line in contents)
            {
                writer.WriteLine(line);
            }
        }
    }

     /// <summary>
     /// Deletes the specified file in VS-compatible way
     /// </summary>