 
 internal static class AuthenticationConfiguration
 {
    public const string EntraAuthorizationSchemeName = "Entra";
    public const string ApiAuthorizationPolicyName = "MsftApi";
    public const string WebAuthorizationPolicyName = "MsftWeb";
     public const string AdminAuthorizationPolicyName = "RequireAdminAccess";
 
     public const string AccountSignInRoute = "/Account/SignIn";
 
     public static readonly string[] AuthenticationSchemes =
     [
        EntraAuthorizationSchemeName,
         OpenIdConnectDefaults.AuthenticationScheme,
     ];
 
         var openIdAuth = services.AddAuthentication(OpenIdConnectDefaults.AuthenticationScheme);
 
         openIdAuth
            .AddMicrosoftIdentityWebApi(entraAuthConfig, EntraAuthorizationSchemeName);
 
         openIdAuth
             .AddMicrosoftIdentityWebApp(options =>
 
         services
             .AddAuthorizationBuilder()
            .AddDefaultPolicy(WebAuthorizationPolicyName, policy =>
                 {
                     policy.AddAuthenticationSchemes(AuthenticationSchemes);
                     policy.RequireAuthenticatedUser();
                     policy.RequireRole(userRole);
                 })
            .AddPolicy(ApiAuthorizationPolicyName, policy =>
                {
                    // Cookie scheme for BarViz, Entra JWT for Darc and other clients
                    // The order matters here as the last scheme's Forbid() handler is used for processing authentication failures
                    // Since cookie scheme returns 200 with the auth exception in the body, Entra should be used instead as it 401s
                    policy.AddAuthenticationSchemes([CookieAuthenticationDefaults.AuthenticationScheme, EntraAuthorizationSchemeName]);
                    policy.RequireAuthenticatedUser();
                    policy.RequireRole(userRole);
                })
             .AddPolicy(AdminAuthorizationPolicyName, policy =>
                 {
                     policy.AddAuthenticationSchemes(AuthenticationSchemes);