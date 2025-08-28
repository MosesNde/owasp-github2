       _container.ExecuteTransactionInIsolatedScope(() => _container.Resolve<IEventStore>().SaveSingleAggregateEvents(_history));
    }
 
   [OneTimeTearDown] public void TearDownTask() => _container?.Dispose();
 
    async Task AssertUncachedAndCachedAggregateLoadTimes(TimeSpan maxUncachedLoadTime, TimeSpan maxCachedLoadTime, IReadOnlyList<IEventMigration> migrations)
    {