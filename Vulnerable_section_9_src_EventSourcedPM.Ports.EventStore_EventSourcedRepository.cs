         IEventStreamProjection<TState, TEvent> stateProjection
     )
     {
        var session = await EventStore.Open(streamId);
         var state = await session.GetState(stateProjection);
 
         return state;
         Func<TState, IEnumerable<TEvent>> action
     )
     {
        var session = await EventStore.Open(streamId);
         var state = await session.GetState(stateProjection);
         var newEvents = (action(state) ?? Enumerable.Empty<TEvent>()).ToList();
         if (newEvents.Count > 0)