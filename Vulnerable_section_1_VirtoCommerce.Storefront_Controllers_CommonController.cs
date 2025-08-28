 using Microsoft.AspNetCore.Authorization;
 using Microsoft.AspNetCore.Identity;
 using Microsoft.AspNetCore.Mvc;
using VirtoCommerce.LiquidThemeEngine;
using VirtoCommerce.Storefront.AutoRestClients.PlatformModuleApi;
 using VirtoCommerce.Storefront.AutoRestClients.StoreModuleApi;
 using VirtoCommerce.Storefront.Domain;
using VirtoCommerce.Storefront.Domain.Security;
 using VirtoCommerce.Storefront.Infrastructure;
 using VirtoCommerce.Storefront.Middleware;
 using VirtoCommerce.Storefront.Model;
     {
         private readonly IStoreModule _storeApi;
         private readonly SignInManager<User> _signInManager;
        public CommonController(IWorkContextAccessor workContextAccesor, IStorefrontUrlBuilder urlBuilder, IStoreModule storeApi,
                                 ISecurity platformSecurityApi, SignInManager<User> signInManager)
              : base(workContextAccesor, urlBuilder)
         {
             _storeApi = storeApi;
             _signInManager = signInManager;
         [HttpPost("contact/{viewName?}")]
         [AllowAnonymous]
         [ValidateAntiForgeryToken]
        public async Task<ActionResult> ContactForm([FromForm]ContactForm model, string viewName = "page.contact")
         {
            //TODO: Test with exist contact us form 
             await _storeApi.SendDynamicNotificationAnStoreEmailAsync(model.ToServiceModel(WorkContext));
             if (model.Contact.ContainsKey("RedirectUrl") && model.Contact["RedirectUrl"].Any())
             {
                     country = WorkContext.AllCountries.FirstOrDefault(c => c.Code2.EqualsInvariant(countryCode));
                 }
             }
             if (country != null)
             {
                 return Json(country.Regions);
             return View("Maintenance");
         }
 
        //An internal special method for handling permanent redirection from routing rules
         public ActionResult InternalRedirect([FromRoute] string url)
         {
            return RedirectPermanent(url);
         }
 
         // GET: common/notheme
             {
                 viewModel = new NoThemeViewModel();
             }
             return View("NoTheme", viewModel);
         }

     }
 }