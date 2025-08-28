             var filePath = GetLatestLogFile(dirPath);
             if (filePath != null)
             {
                StartFileWatchingThread(filePath, true);
             }
             var watcher = new FileSystemWatcher(dirPath, VRCBaseLogParser.VRChatLogFileFilter)
             {