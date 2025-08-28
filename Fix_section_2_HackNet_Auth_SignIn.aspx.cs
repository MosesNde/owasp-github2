 					Session["TempKeyStore"] = ks;
 					Session["Cookie"] = a.AuthCookie;
 					Session["PasswordSuccess"] = email;
					Session["ReturnUrl"] = "~" + Request.QueryString["ReturnUrl"];
 					Response.Redirect("~/Auth/OtpVerify");
 				} else
 				{
 					Session["KeyStore"] = ks;
					string redir = Request.QueryString["ReturnUrl"];
 					Response.Cookies.Add(a.AuthCookie);
 					if (Request.QueryString["ReturnUrl"] != null)
						Response.Redirect("~" + redir);
 					else
 						Response.Redirect("~/Default");
 				}