       _container.ExecuteTransactionInIsolatedScope(() => _container.Resolve<IEventStore>().SaveSingleAggregateEvents(_history));
    }
 
   [OneTimeTearDown] public async Task TearDownTask()
   {
      if(_container != null)
         await _container.DisposeAsync().CaF();
   }
 
    async Task AssertUncachedAndCachedAggregateLoadTimes(TimeSpan maxUncachedLoadTime, TimeSpan maxCachedLoadTime, IReadOnlyList<IEventMigration> migrations)
    {