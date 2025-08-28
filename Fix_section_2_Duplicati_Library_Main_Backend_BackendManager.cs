                 Logging.Log.WriteWarningMessage(LOGTAG, "BackendManagerShutdown", null, "Backend manager queue runner did not stop");
             if (queueRunner.IsFaulted)
                 Logging.Log.WriteWarningMessage(LOGTAG, "BackendManagerShutdown", queueRunner.Exception, "Backend manager queue runner crashed");
         }

        if (queueRunner.IsCompleted)
            queueRunner.Dispose();
     }
 }