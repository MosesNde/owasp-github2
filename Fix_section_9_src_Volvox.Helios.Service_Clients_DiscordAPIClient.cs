         }
 
         /// <summary>
        ///     Get all of the currently logged in users guilds.
         /// </summary>
        /// <returns>JSON array of the logged in users guilds.</returns>
         public async Task<string> GetUserGuilds()
         {
             // Cache the users guilds.
         }
 
         /// <summary>
        ///     Get all of the channels in the specified guild.
         /// </summary>
         /// <param name="guildId">Id of the guild.</param>
        /// <returns>JSON array of channels in the guild.</returns>
         public async Task<string> GetGuildChannels(ulong guildId)
         {
            SetBotToken();
 
             return await _client.GetStringAsync($"guilds/{guildId}/channels");
         }
 
        /// <summary>
        ///     Get all of the roles in the specified guild.
        /// </summary>
        /// <param name="guildId">Id of the guild.</param>
        /// <returns>JSON array of roles in the guild.</returns>
        public async Task<string> GetGuildRoles(ulong guildId)
        {
            SetBotToken();

            return await _client.GetStringAsync($"guilds/{guildId}/roles");
        }

        /// <summary>
        ///     Add the bot token to the authentication header.
        /// </summary>
        private void SetBotToken()
        {
            _client.DefaultRequestHeaders.Authorization =
                new AuthenticationHeaderValue("Bot", _configuration["Discord:Token"]);
        }

         /// <summary>
         ///     Get the id of the currently logged in user.
         /// </summary>