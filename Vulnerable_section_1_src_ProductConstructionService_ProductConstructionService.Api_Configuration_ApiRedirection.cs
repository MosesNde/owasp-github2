         }
 
         var authService = context.RequestServices.GetRequiredService<IAuthorizationService>();
        AuthorizationResult result = await authService.AuthorizeAsync(success.Ticket!.Principal, AuthenticationConfiguration.MsftAuthorizationPolicyName);
         if (!result.Succeeded)
         {
             context.Response.StatusCode = (int)HttpStatusCode.Forbidden;