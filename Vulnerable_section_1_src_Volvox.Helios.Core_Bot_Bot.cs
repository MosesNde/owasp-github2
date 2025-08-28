             Connector = new BotConnector(settings, Client);
         }
 
         /// <summary>
         /// Initialize all of modules available to the bot.
         /// </summary>
             }
         }
 
         /// <summary>
         /// Start the bot.
         /// </summary>
             await Task.Delay(Timeout.Infinite);
         }
 
         /// <summary>
         /// Stop the bot.
         /// </summary>
             await Connector.Disconnect();
         }
 
         /// <summary>
         /// Get a list of the guilds the bot is in.
         /// </summary>
             return Client.Guilds;
         }
 
         /// <summary>
         /// Returns true if the specified guild is in the bot and false otherwise.
         /// </summary>
             return GetGuilds().Any(g => g.Id == guildId);
         }
 
         /// <summary>
         /// Log an event.
         /// </summary>
             return Task.CompletedTask;
         }
 
         /// <summary>
         /// Client for the bot.
         /// </summary>
         public DiscordSocketClient Client { get; }
 
         /// <summary>
         /// Connector that the bot uses to connect to Discord.
         /// </summary>
         public IBotConnector Connector { get; }
 
         /// <summary>
         /// List of modules for the bot.
         /// </summary>
         public IList<IModule> Modules { get; }
 
         /// <summary>
         /// Application logger.
         /// </summary>