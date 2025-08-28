     var context = services.GetRequiredService<BlogCoreContext>();
     var userManager = scope.ServiceProvider.GetRequiredService<UserManager<User>>();
     var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<Role>>();
    await DbInitializer.SeedWithDefaultValues(context, roleManager, userManager);
 }
 
 namespace BlogCoreAPI