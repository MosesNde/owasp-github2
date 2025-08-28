             List<string> arguments = new List<string>();
             SetArgumentListForConsoleApp(arguments, generatedFileName, options, sharedCodeServiceParameters, loggingServer.PipeName);
 
            string fileName = RiaClientFilesTaskHelpers.CreateAndWriteArgumentsToNewTempFile(arguments);

            startInfo.Arguments = "@" + fileName;
 
             var process = Process.Start(startInfo);
 
                 }
                 else
                 {
                    RiaClientFilesTaskHelpers.SafeFileDelete(fileName, this);
                 }
                 return success;
             }