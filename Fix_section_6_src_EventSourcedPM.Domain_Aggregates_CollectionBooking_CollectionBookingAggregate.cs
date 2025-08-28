                         CollectionDate = state.CollectionDate.ToIsoDate(),
                         BookAt = scheduled.BookAt.ToIsoTimestamp()
                     } as BaseCollectionBookingEvent,
                failed => new CollectionBookingSchedulingFailed
                {
                    ShipmentId = (string)state.ShipmentId,
                    ProcessCategory = (string)processCategory,
                    CarrierId = (Guid)state.CollectionLeg.CarrierId,
                    CollectionDate = state.CollectionDate.ToIsoDate(),
                    Failure = failed.Failure
                }
             )
         ];
     }