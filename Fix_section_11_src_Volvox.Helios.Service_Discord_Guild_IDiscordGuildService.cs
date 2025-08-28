     public interface IDiscordGuildService
     {
         /// <summary>
        ///     Get all of the channels in the specified guild.
         /// </summary>
         /// <param name="guildId">Id of the guild.</param>
         /// <returns>List of channels in the guild.</returns>
         Task<List<Channel>> GetChannels(ulong guildId);

        /// <summary>
        ///     Get all of the roles in the specified guild.
        /// </summary>
        /// <param name="guildId">Id of the guild.</param>
        /// <returns>List of roles in the guild.</returns>
        Task<List<Role>> GetRoles(ulong guildId);
     }
 }
\ No newline at end of file