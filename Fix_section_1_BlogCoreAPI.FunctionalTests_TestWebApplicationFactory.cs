                 var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<Role>>();
                 await context.Database.EnsureCreatedAsync();
                 // Fill Db with data
                await DbInitializer.SeedWithDefaultValues(context, roleManager, userManager);
 
                 var configuration = GetConfiguration();
                 var user = configuration.GetSection("Users").GetSection("User").Get<Models.User>();