 
             return JsonConvert.DeserializeObject<List<Channel>>(channels);
         }

        /// <inheritdoc />
        /// <summary>
        ///     Get all of the roles in the specified guild.
        /// </summary>
        /// <param name="guildId">Id of the guild.</param>
        /// <returns>List of roles in the guild.</returns>
        public async Task<List<Role>> GetRoles(ulong guildId)
        {
            var roles = await _client.GetGuildRoles(guildId);

            return JsonConvert.DeserializeObject<List<Role>>(roles);
        }
     }
 }
\ No newline at end of file