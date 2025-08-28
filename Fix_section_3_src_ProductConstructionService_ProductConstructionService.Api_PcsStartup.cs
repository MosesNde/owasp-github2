         builder.Services.AddRazorPages(
             options =>
             {
                options.Conventions.AuthorizeFolder("/", AuthenticationConfiguration.WebAuthorizationPolicyName);
                 options.Conventions.AllowAnonymousToPage("/Error");
             })
             .AddGitHubWebHooks()
         app.UseEndpoints(e =>
         {
             var controllers = e.MapControllers();
            controllers.RequireAuthorization(AuthenticationConfiguration.ApiAuthorizationPolicyName);

             if (isDevelopment)
             {
                 controllers.AllowAnonymous();