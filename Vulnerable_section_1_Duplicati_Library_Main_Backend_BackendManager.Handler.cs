     /// <summary>
     /// The handler for processing backend operations
     /// </summary>
    private class Handler
     {
         /// <summary>
         /// The tag used for logging
         /// <returns>An awaitable task</returns>
         public static Task RunHandlerAsync(IReadChannel<PendingOperationBase> requestChannel, string backendUrl, ExecuteContext context)
             => AutomationExtensions.RunTask(new { requestChannel },
                self => new Handler(backendUrl, context).Run(self.requestChannel)
            );
 
         /// <summary>
         /// Creates a new instance of the <see cref="Handler"/> class
                 throw;
             }
         }
     }
 }