     public Task Consume(ConsumeContext<CollectionBookingEvents.CollectionBooked> context) =>
         processManager.InvokeProcessTrigger(context.Message);
 
    public Task Consume(
        ConsumeContext<CollectionBookingEvents.CollectionBookingSubprocessFailed> context
    ) => processManager.InvokeProcessTrigger(context.Message);
 
     public Task Consume(ConsumeContext<CollectionBookingCompleted> context) =>
         processManager.InvokeProcessTrigger(context.Message);