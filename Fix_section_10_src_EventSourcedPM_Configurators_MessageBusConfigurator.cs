                             .Handle<Ports.EventStore.ConcurrencyException>();
                     });
 
                    cfg.PrefetchCount = settings.MassTransit.PrefetchCount;
                    cfg.ConcurrentMessageLimit = settings.MassTransit.ConcurrencyLimit;

                     cfg.ConfigureEndpoints(context);
                 }
             );