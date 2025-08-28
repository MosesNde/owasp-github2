                 identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                 await HttpContext.SignInAsync(DefaultAuthorizeAttribute.DefaultAuthenticationScheme, new ClaimsPrincipal(identity));
 
                if (ReturnUrl.IsNullOrEmpty() || !Url.IsLocalUrl(ReturnUrl))
                 {
                     return RedirectToAction("Index", "Dashboard");
                 }
                 identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                 await HttpContext.SignInAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, new ClaimsPrincipal(identity));
 
                if (ReturnUrl.IsNullOrEmpty() || !Url.IsLocalUrl(ReturnUrl))
                 {
                     return RedirectToAction("Index");
                 }