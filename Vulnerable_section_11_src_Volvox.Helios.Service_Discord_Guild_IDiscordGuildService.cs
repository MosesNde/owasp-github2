     public interface IDiscordGuildService
     {
         /// <summary>
        ///     Get all of the channels for the specified guild.
         /// </summary>
         /// <param name="guildId">Id of the guild.</param>
         /// <returns>List of channels in the guild.</returns>
         Task<List<Channel>> GetChannels(ulong guildId);
     }
 }
\ No newline at end of file