 using System.Collections.Generic;
 using System.Linq;
 using System.Threading.Tasks;
using DBAccess.Builders;
 using DBAccess.Data;
 using DBAccess.Data.JoiningEntity;
 using DBAccess.Data.Permission;
     /// </summary>
     public static class DbInitializer
     {
        private const string UserRole = "User";
        private const string RedactorRole = "Redactor";
        private const string AdminRole = "Admin";
 
        private static async Task GenerateDefaultRoles(RoleManager<Role> roleManager)
        {
            await new RoleBuilder(UserRole, roleManager)
                .WithCanReadAllOnAllResources()
                .WithCanCreateOwn(PermissionTarget.Comment)
                .WithCanCreateOwn(PermissionTarget.Like)
                .WithCanUpdateOwn(PermissionTarget.Comment)
                .WithCanUpdateOwn(PermissionTarget.Like)
                .WithCanUpdateOwn(PermissionTarget.User)
                .WithCanDeleteOwn(PermissionTarget.Comment)
                .WithCanDeleteOwn(PermissionTarget.Like)
                .Build();

            await new RoleBuilder(RedactorRole, roleManager)
                .WithCanCreateAll(PermissionTarget.Category)
                .WithCanCreateAll(PermissionTarget.Tag)
                .WithCanCreateOwn(PermissionTarget.Post)
                .WithCanUpdateOwn(PermissionTarget.Post)
                .WithCanDeleteOwn(PermissionTarget.Post)
                .Build();

            await new RoleBuilder(AdminRole, roleManager)
                .WithCanReadAllOnAllResources()
                .WithCanCreateAllOnAllResources()
                .WithCanUpdateAllOnAllResources()
                .WithCanDeleteAllOnAllResources()
                .Build();
         }
 
        private static async Task GenerateDefaultUsers(UserManager<User> userManager)
         {
             var users = new List<(User, string)>()
             {
                (new UserBuilder().WithEmail("Sam@email.com").WithUsername("Sam").Build(), "0a1234A@"),
                (new UserBuilder().WithEmail("fredon@email.com").WithUsername("Frodon").Build(), "0a0000A@"),
                (new UserBuilder().WithEmail("jamy@email.com").WithUsername("Jamy")
                    .WithDescription("Hello, my name is Jamy, I love food").Build(), "0JamyRedactA@"),
                (new UserBuilder().WithEmail("fred@email.com").WithUsername("Fred").Build(), "0FredRedactA@"),
                (new UserBuilder().WithEmail("admin@emailblogcore.com").WithUsername("AdminUser")
                    .WithDescription("I'm admin, I manage this blog").Build(), "0adminPasswordA@")
             };
             foreach (var user in users)
             {
                 await userManager.CreateAsync(user.Item1, user.Item2);
             }
         }
 
        private static void AssignRolesToDefaultUsers(BlogCoreContext context)
         {
             context.UserRoles.AddRange(
                new UserRoleBuilder(context).WithUser("Jamy").WithRole(UserRole).Build(),
                new UserRoleBuilder(context).WithUser("Fred").WithRole(UserRole).Build(),
                new UserRoleBuilder(context).WithUser("Frodon").WithRole(UserRole).Build(),
                new UserRoleBuilder(context).WithUser("Sam").WithRole(UserRole).Build(),
                new UserRoleBuilder(context).WithUser("AdminUser").WithRole(UserRole).Build(),

                new UserRoleBuilder(context).WithUser("Fred").WithRole(RedactorRole).Build(),
                new UserRoleBuilder(context).WithUser("Jamy").WithRole(RedactorRole).Build(),

                new UserRoleBuilder(context).WithUser("AdminUser").WithRole(AdminRole).Build()
            );
             context.SaveChanges();
         }
 
        private static void GenerateDefaultTags(BlogCoreContext context)
         {
             var scienceTag = new Tag() { Name = "Science" };
             var journeyTag = new Tag { Name = "Journey" };
             context.SaveChanges();
         }
 
        private static void GenerateDefaultCategories(BlogCoreContext context)
         {
             var healthyFoodCategory = new Category() { Name = "HealthyFood" };
             var discoveryCategory = new Category() { Name = "Discovery" };
             var legendCategory = new Category() { Name = "Legend" };
             context.Categories.AddRange(healthyFoodCategory, discoveryCategory, legendCategory);
             context.SaveChanges();
         }
 
        private static void GenerateDefaultPostTags(BlogCoreContext context)
         {
             var failFoodPost = context.Posts.Single(x => x.Name == "I failed my pumpkin soup :'(");
             var volcanoes = context.Posts.Single(x => x.Name == "Volcanoes are cool");
             context.SaveChanges();
         }
 
        private static void GenerateDefaultPosts(BlogCoreContext context)
         {
 
             var failFoodPost = new Post()
             context.SaveChanges();
         }
 
        private static void GenerateDefaultLikes(BlogCoreContext context)
         {
             var fredAddDetail = context.Comments.Single(x =>
                 x.Author.UserName == "Fred" && x.Content == "Also, they are beautiful !");
             context.SaveChanges();
         }
 
        private static void GenerateDefaultComments(BlogCoreContext context)
         {
             var volcanoes = context.Posts.Single(x => x.Name == "Volcanoes are cool");

            var scaryVolcanoes = 
                new Comment()
             {
                 Author = context.Users.Single(x => x.UserName == "Sam"),
                 Content = "I don't like volcanoes, they are scary :'(",
         /// <param name="context"></param>
         /// <param name="roleManager"></param>
         /// <param name="userManager"></param>
        public static async Task SeedWithDefaultValues(BlogCoreContext context, RoleManager<Role> roleManager,
             UserManager<User> userManager)
         {
             if (!context.Roles.Any())
             {
                await GenerateDefaultRoles(roleManager);
                await GenerateDefaultUsers(userManager);
                AssignRolesToDefaultUsers(context);
                GenerateDefaultTags(context);
                GenerateDefaultCategories(context);
                GenerateDefaultPosts(context);
                GenerateDefaultPostTags(context);
                GenerateDefaultComments(context);
                GenerateDefaultLikes(context);
             }
         }
     }