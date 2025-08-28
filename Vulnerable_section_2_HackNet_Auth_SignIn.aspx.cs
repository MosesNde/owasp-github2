 					Session["TempKeyStore"] = ks;
 					Session["Cookie"] = a.AuthCookie;
 					Session["PasswordSuccess"] = email;
					Session["ReturnUrl"] = Request.QueryString["ReturnUrl"];
 					Response.Redirect("~/Auth/OtpVerify");
 				} else
 				{
 					Session["KeyStore"] = ks;
					Session["ReturnUrl"] = null;
 					Response.Cookies.Add(a.AuthCookie);
 					if (Request.QueryString["ReturnUrl"] != null)
						Response.Redirect("~" + Request.QueryString["ReturnUrl"]);
 					else
 						Response.Redirect("~/Default");
 				}