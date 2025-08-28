     public static IServiceCollection AddApplicationSerilog(this IServiceCollection services)
     {
         Log.Logger = new LoggerConfiguration()
            .MinimumLevel.Warning()
            .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
             .Enrich.FromLogContext()
             .WriteTo.Console()
             .CreateLogger();