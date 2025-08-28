         /// <returns>Returns true if the specified guild is in the bot and false otherwise.</returns>
         bool IsBotInGuild(ulong guildId);
 
        /// <summary>
        /// Get the bots role in the hierarchy of the specified guild.
        /// </summary>
        /// <param name="guildId">Id of the guild to get the hierarchy from.</param>
        /// <returns>Bots role position.</returns>
        int GetBotRoleHierarchy(ulong guildId);

             /// <summary>
         /// Log an event.
         /// </summary>