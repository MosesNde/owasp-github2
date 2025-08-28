 using Volvox.Helios.Core.Bot;
 using Volvox.Helios.Core.Modules.Common;
 using Volvox.Helios.Core.Modules.StreamAnnouncer;
using Volvox.Helios.Core.Modules.StreamerRole;
 using Volvox.Helios.Core.Utilities;
 using Volvox.Helios.Service;
 using Volvox.Helios.Service.Clients;
             services.AddSingleton<IBot, Bot>();
 
             // Modules
             services.AddSingleton<IModule, StreamAnnouncerModule>();
            services.AddSingleton<IModule, StreamerRoleModule>();
 
             // All Modules
             services.AddSingleton<IList<IModule>>(s => s.GetServices<IModule>().ToList());