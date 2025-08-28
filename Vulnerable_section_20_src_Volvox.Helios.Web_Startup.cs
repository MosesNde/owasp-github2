 using Volvox.Helios.Core.Bot;
 using Volvox.Helios.Core.Modules.Common;
 using Volvox.Helios.Core.Modules.StreamAnnouncer;
 using Volvox.Helios.Core.Utilities;
 using Volvox.Helios.Service;
 using Volvox.Helios.Service.Clients;
             services.AddSingleton<IBot, Bot>();
 
             // Modules
            //services.AddSingleton<IModule, StreamerRoleModule>();
             services.AddSingleton<IModule, StreamAnnouncerModule>();
 
             // All Modules
             services.AddSingleton<IList<IModule>>(s => s.GetServices<IModule>().ToList());