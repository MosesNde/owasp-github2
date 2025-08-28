         }
 
         /// <summary>
        ///     Get all of the currently logged in users.
         /// </summary>
        /// <returns>List of the logged in users guilds.</returns>
         public async Task<string> GetUserGuilds()
         {
             // Cache the users guilds.
         }
 
         /// <summary>
        ///     Get all of the channels for the specififed guild.
         /// </summary>
         /// <param name="guildId">Id of the guild.</param>
        /// <returns>List opf channels in the guild.</returns>
         public async Task<string> GetGuildChannels(ulong guildId)
         {
            // Set bot token.
            _client.DefaultRequestHeaders.Authorization =
                new AuthenticationHeaderValue("Bot", _configuration["Discord:Token"]);
 
             return await _client.GetStringAsync($"guilds/{guildId}/channels");
         }
 
         /// <summary>
         ///     Get the id of the currently logged in user.
         /// </summary>