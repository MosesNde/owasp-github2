                 identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                 await HttpContext.SignInAsync(DefaultAuthorizeAttribute.DefaultAuthenticationScheme, new ClaimsPrincipal(identity));
 
                if (ReturnUrl.IsNullOrEmpty())
                 {
                     return RedirectToAction("Index", "Dashboard");
                 }
                 identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                 await HttpContext.SignInAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, new ClaimsPrincipal(identity));
 
                if (ReturnUrl.IsNullOrEmpty())
                 {
                     return RedirectToAction("Index");
                 }