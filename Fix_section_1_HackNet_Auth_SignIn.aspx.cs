 		{
 			using (Authenticate a = new Authenticate(email))
 			{
				string redir = Request.QueryString["ReturnUrl"];

				if (string.IsNullOrWhiteSpace(redir))
					redir = "~/Default";
				else if (redir.Equals("/"))
					redir = "~/Default";
				else
					redir = Request.QueryString["ReturnUrl"];
					
 				if (a.Is2FAEnabled)
 				{
 					Session["TempKeyStore"] = ks;
 					Session["Cookie"] = a.AuthCookie;
 					Session["PasswordSuccess"] = email;
					Session["ReturnUrl"] = redir;
 					Response.Redirect("~/Auth/OtpVerify");
 				} else
 				{
 					Session["KeyStore"] = ks;
 					Response.Cookies.Add(a.AuthCookie);
					Response.Redirect(redir);
 				}
 			}
 		}