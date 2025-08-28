         {
             return guilds.Where(g => ids.Any(i => i == g.Id)).ToList();
         }

        /// <summary>
        ///     Remove the managed roles from the list.
        /// </summary>
        /// <param name="roles">List of roles.</param>
        /// <returns>List of unmanaged roles.</returns>
        public static IEnumerable<Role> RemoveManaged(this IEnumerable<Role> roles)
        {
            return roles.Where(r => !r.Managed);
        }
     }
 }