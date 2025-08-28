     /// <summary>
     /// The handler for processing backend operations
     /// </summary>
    private class Handler : IDisposable
     {
         /// <summary>
         /// The tag used for logging
         /// <returns>An awaitable task</returns>
         public static Task RunHandlerAsync(IReadChannel<PendingOperationBase> requestChannel, string backendUrl, ExecuteContext context)
             => AutomationExtensions.RunTask(new { requestChannel },
                async self =>
                {
                    using var handler = new Handler(backendUrl, context);
                    await handler.Run(self.requestChannel);
                });
 
         /// <summary>
         /// Creates a new instance of the <see cref="Handler"/> class
                 throw;
             }
         }

        public void Dispose()
        {
            while (backendPool.TryDequeue(out var backend)) backend?.Dispose();
        }
     }
 }