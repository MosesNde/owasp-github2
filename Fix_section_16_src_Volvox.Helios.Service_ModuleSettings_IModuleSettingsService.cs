         /// <param name="guildId">Guild settings to get.</param>
         /// <returns>Settings from the specified guild.</returns>
         Task<T> GetSettingsByGuild(ulong guildId);

        /// <summary>
        ///     Remove the specified setting record.
        /// </summary>
        /// <param name="settings">Module settings to remove.</param>
        Task RemoveSetting(T settings);
     }
 }
\ No newline at end of file