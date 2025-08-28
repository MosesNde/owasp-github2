                                 {
                                     if (frame != null)
                                     {
                                        // Using ensures the frame is disposed in case no one took ownership
                                        using (frame.GetHandle())
                                            observer.OnNext(frame);
                                         await scheduler.Yield(token);
                                     }
                                     else
                                 {
                                     if (frame != null)
                                     {
                                        // Using ensures the frame is disposed in case no one took ownership
                                        using (frame.GetHandle())
                                            observer.OnNext(frame);
                                         await scheduler.Yield(token);
                                     }
                                     else