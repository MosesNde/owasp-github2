         builder.Services.AddRazorPages(
             options =>
             {
                options.Conventions.AuthorizeFolder("/", AuthenticationConfiguration.MsftAuthorizationPolicyName);
                 options.Conventions.AllowAnonymousToPage("/Error");
             })
             .AddGitHubWebHooks()
         app.UseEndpoints(e =>
         {
             var controllers = e.MapControllers();
             if (isDevelopment)
             {
                 controllers.AllowAnonymous();