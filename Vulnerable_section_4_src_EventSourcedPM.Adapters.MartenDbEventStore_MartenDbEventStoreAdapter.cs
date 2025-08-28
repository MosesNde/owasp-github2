 internal sealed class MartenDbEventStreamSession<TState, TEvent>(
     IDocumentStore documentStore,
     IEventPublisher eventPublisher,
    EventStreamId streamId)
    : IEventStreamSession<TState, TEvent>
 {
     private IEventPublisher EventPublisher { get; } = eventPublisher;
     private IDocumentSession Session { get; } = documentStore.LightweightSession();
 
 public sealed class MartenDbEventStoreAdapter<TState, TEvent>(
     IDocumentStore documentStore,
    IEventPublisher eventPublisher)
    : IEventStore<TState, TEvent>
 {
     private IDocumentStore DocumentStore { get; } = documentStore;
     private IEventPublisher EventPublisher { get; } = eventPublisher;