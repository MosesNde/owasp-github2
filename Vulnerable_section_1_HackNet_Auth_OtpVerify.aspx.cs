 			Session["LoginSuccess"] = null;
 			Session["Cookie"] = null;
 			if (returnurl != null)
				Response.Redirect("~" + Session["ReturnUrl"]);
 			else
 				Response.Redirect("~/Default");
 		}