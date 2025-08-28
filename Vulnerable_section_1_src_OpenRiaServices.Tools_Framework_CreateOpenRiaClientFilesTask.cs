             List<string> arguments = new List<string>();
             SetArgumentListForConsoleApp(arguments, generatedFileName, options, sharedCodeServiceParameters, loggingServer.PipeName);
 
            // TODO: Fix vulnerability with GetTempFileName, see https://sonarcloud.io/project/issues?resolved=false&severities=BLOCKER%2CCRITICAL%2CMAJOR%2CMINOR&sinceLeakPeriod=true&types=VULNERABILITY&pullRequest=414&id=OpenRIAServices_OpenRiaServices&open=AYi1D8MZVJzuBbc9Xd8Q&tab=why
            // and add error handling 
            string filename = Path.GetTempFileName();
            File.WriteAllLines(filename, arguments);
            startInfo.Arguments = "@" + filename;
 
             var process = Process.Start(startInfo);
 
                 }
                 else
                 {
                    RiaClientFilesTaskHelpers.SafeFileDelete(filename, this);
                 }
                 return success;
             }