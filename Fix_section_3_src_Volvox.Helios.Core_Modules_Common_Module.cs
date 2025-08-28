 ﻿using System;
 using System.Threading.Tasks;
 using Discord.WebSocket;
using Microsoft.Extensions.Configuration;
 using Microsoft.Extensions.Logging;
 using Volvox.Helios.Core.Utilities;
 
     /// <summary>
     ///     Unit of the bot.
     /// </summary>
    public abstract class Module : IModule
     {
         /// <summary>
         ///     Unit of the bot.
         /// </summary>
         /// <param name="discordSettings">Settings used to connect to Discord.</param>
        /// <param name="logger">Logger.</param>
        /// <param name="config">Application configuration.</param>
        protected Module(IDiscordSettings discordSettings, ILogger<IModule> logger, IConfiguration config)
         {
             DiscordSettings = discordSettings;
             Logger = logger;

            var moduleQuery = GetType().Name;
            Name = config[$"Metadata:{moduleQuery}:Name"];
            Version = config[$"Metadata:{moduleQuery}:Version"];
            Description = config[$"Metadata:{moduleQuery}:Description"];
            ReleaseState = Enum.Parse<ReleaseState>(config[$"Metadata:{moduleQuery}:ReleaseState"]);
         }
 
         /// <summary>