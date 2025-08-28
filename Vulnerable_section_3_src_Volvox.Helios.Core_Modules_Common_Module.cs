 ﻿using System;
 using System.Threading.Tasks;
 using Discord.WebSocket;
 using Microsoft.Extensions.Logging;
 using Volvox.Helios.Core.Utilities;
 
     /// <summary>
     ///     Unit of the bot.
     /// </summary>
    public abstract class Module : IModule, IDocumented
     {
         /// <summary>
         ///     Unit of the bot.
         /// </summary>
         /// <param name="discordSettings">Settings used to connect to Discord.</param>
        protected Module(IDiscordSettings discordSettings, ILogger<IModule> logger)
         {
             DiscordSettings = discordSettings;
             Logger = logger;
         }
 
         /// <summary>