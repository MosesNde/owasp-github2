             Connector = new BotConnector(settings, Client);
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Initialize all of modules available to the bot.
         /// </summary>
             }
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Start the bot.
         /// </summary>
             await Task.Delay(Timeout.Infinite);
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Stop the bot.
         /// </summary>
             await Connector.Disconnect();
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Get a list of the guilds the bot is in.
         /// </summary>
             return Client.Guilds;
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Returns true if the specified guild is in the bot and false otherwise.
         /// </summary>
             return GetGuilds().Any(g => g.Id == guildId);
         }
 
        /// <inheritdoc />
        /// <summary>
        /// Get the bots role in the hierarchy of the specified guild.
        /// </summary>
        /// <param name="guildId">Id of the guild to get the hierarchy from.</param>
        /// <returns>Bots role position.</returns>
        public int GetBotRoleHierarchy(ulong guildId)
        {
            var hierarchy = GetGuilds()?.FirstOrDefault(g => g.Id == guildId)?.CurrentUser.Hierarchy;

            return hierarchy ?? 0;
        }

        /// <inheritdoc />
         /// <summary>
         /// Log an event.
         /// </summary>
             return Task.CompletedTask;
         }
 
        /// <inheritdoc />
         /// <summary>
         /// Client for the bot.
         /// </summary>
         public DiscordSocketClient Client { get; }
 
        /// <inheritdoc />
         /// <summary>
         /// Connector that the bot uses to connect to Discord.
         /// </summary>
         public IBotConnector Connector { get; }
 
        /// <inheritdoc />
         /// <summary>
         /// List of modules for the bot.
         /// </summary>
         public IList<IModule> Modules { get; }
 
        /// <inheritdoc />
         /// <summary>
         /// Application logger.
         /// </summary>