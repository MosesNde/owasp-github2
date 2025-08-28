 
 internal static class AuthenticationConfiguration
 {
    public const string EntraAuthorizationPolicyName = "Entra";
    public const string MsftAuthorizationPolicyName = "msft";
     public const string AdminAuthorizationPolicyName = "RequireAdminAccess";
 
     public const string AccountSignInRoute = "/Account/SignIn";
 
     public static readonly string[] AuthenticationSchemes =
     [
        EntraAuthorizationPolicyName,
         OpenIdConnectDefaults.AuthenticationScheme,
     ];
 
         var openIdAuth = services.AddAuthentication(OpenIdConnectDefaults.AuthenticationScheme);
 
         openIdAuth
            .AddMicrosoftIdentityWebApi(entraAuthConfig, EntraAuthorizationPolicyName);
 
         openIdAuth
             .AddMicrosoftIdentityWebApp(options =>
 
         services
             .AddAuthorizationBuilder()
            .AddPolicy(MsftAuthorizationPolicyName, policy =>
                 {
                     policy.AddAuthenticationSchemes(AuthenticationSchemes);
                     policy.RequireAuthenticatedUser();
                     policy.RequireRole(userRole);
                 })
             .AddPolicy(AdminAuthorizationPolicyName, policy =>
                 {
                     policy.AddAuthenticationSchemes(AuthenticationSchemes);