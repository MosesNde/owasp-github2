     public class SettingsController : Controller
     {
         private readonly IModuleSettingsService<StreamAnnouncerSettings> _streamAnnouncerSettingsService;
 
        public SettingsController(IModuleSettingsService<StreamAnnouncerSettings> streamAnnouncerSettingsService)
         {
             _streamAnnouncerSettingsService = streamAnnouncerSettingsService;
         }
 
         public IActionResult Index(ulong guildId, [FromServices] IBot bot,
 
             return RedirectToAction("Index");
         }
        
         #endregion
     }
 }
\ No newline at end of file