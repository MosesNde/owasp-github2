using System.Collections.Generic;
 using System.Linq;
 using System.Threading.Tasks;
 using Discord;
 using Discord.WebSocket;
using Microsoft.Extensions.Configuration;
 using Microsoft.Extensions.Logging;
 using Volvox.Helios.Core.Modules.Common;
 using Volvox.Helios.Core.Utilities;
 using Volvox.Helios.Domain.ModuleSettings;
 using Volvox.Helios.Service.ModuleSettings;
 
 namespace Volvox.Helios.Core.Modules.StreamAnnouncer
 {
     /// <summary>
    ///     Announce the user to a specified channel when the user starts streaming.
     /// </summary>
     public class StreamAnnouncerModule : Module
     {
         private readonly IModuleSettingsService<StreamAnnouncerSettings> _settingsService;
         private IDictionary<ulong, HashSet<ulong>> StreamingList { get; } = new Dictionary<ulong, HashSet<ulong>>();
 
         /// <summary>
        ///     Announce the user to a specified channel when streaming.
         /// </summary>
         /// <param name="discordSettings">Settings used to connect to Discord.</param>
         /// <param name="logger">Logger.</param>
        /// <param name="config">Application configuration.</param>
        /// <param name="settingsService">Settings service.</param>
        public StreamAnnouncerModule(IDiscordSettings discordSettings, ILogger<StreamAnnouncerModule> logger,
            IConfiguration config, IModuleSettingsService<StreamAnnouncerSettings> settingsService) : base(
            discordSettings, logger, config)
         {
             _settingsService = settingsService;
         }
 
         /// <summary>
        ///     Initialize the module on GuildMemberUpdated event.
         /// </summary>
         /// <param name="client">Client for the module to be registered to.</param>
         public override Task Init(DiscordSocketClient client)
             {
                 var settings = await _settingsService.GetSettingsByGuild(guildUser.Guild.Id);
 
                if (settings != null && settings.Enabled)
                     await CheckUser(guildUser);
             };
 
             return Task.CompletedTask;
         }
 
         /// <summary>
        ///     Announces the user if it's appropriate to do so.
         /// </summary>
         /// <param name="user">User to be evaluated/adjusted for streaming announcement.</param>
         private async Task CheckUser(SocketGuildUser user)
                 set = new HashSet<ulong>();
                 StreamingList[user.Guild.Id] = set;
             }

             // Check to make sure the user is streaming and not in the streaming list.
             if (user.Game != null && user.Game.Value.StreamType == StreamType.Twitch &&
                 !StreamingList.Any(u => u.Key == user.Guild.Id && u.Value.Contains(user.Id)))
             }
 
             // User is not streaming.
            else if (user.Game == null || user.Game.Value.StreamType != StreamType.Twitch)
             {
                 // Remove the user from the list.
                 StreamingList[user.Guild.Id].Remove(user.Id);
             }
         }
 
         /// <summary>
        ///     Announces the users stream to the appropriate channel.
         /// </summary>
         /// <param name="user">User to be announced.</param>
         private async Task AnnounceUser(SocketGuildUser user)