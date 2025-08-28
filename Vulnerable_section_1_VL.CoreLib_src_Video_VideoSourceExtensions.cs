                                 {
                                     if (frame != null)
                                     {
                                        observer.OnNext(frame);
                                         await scheduler.Yield(token);
                                     }
                                     else
                                 {
                                     if (frame != null)
                                     {
                                        observer.OnNext(frame);
                                         await scheduler.Yield(token);
                                     }
                                     else