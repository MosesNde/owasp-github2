     var context = services.GetRequiredService<BlogCoreContext>();
     var userManager = scope.ServiceProvider.GetRequiredService<UserManager<User>>();
     var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<Role>>();
    await DbInitializer.Seed(context, roleManager, userManager);
 }
 
 namespace BlogCoreAPI