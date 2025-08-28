             }
         }
 
        /// <inheritdoc />
        public async Task RemoveSetting(T settings)
        {
            // Create a new scope to get the db context.
            using (var scope = _scopeFactory.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<VolvoxHeliosContext>();
                
                context.Remove(settings);

                await context.SaveChangesAsync();
            }
        }

         /// <summary>
         ///     Create a unique caching key based on the specified guild.
         /// </summary>