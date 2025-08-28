     public class SettingsController : Controller
     {
         private readonly IModuleSettingsService<StreamAnnouncerSettings> _streamAnnouncerSettingsService;
        private readonly IModuleSettingsService<StreamerRoleSettings> _streamerRoleSettingsService;
 
        public SettingsController(IModuleSettingsService<StreamAnnouncerSettings> streamAnnouncerSettingsService, IModuleSettingsService<StreamerRoleSettings> streamerRoleSettingsService)
         {
             _streamAnnouncerSettingsService = streamAnnouncerSettingsService;
            _streamerRoleSettingsService = streamerRoleSettingsService;
         }
 
         public IActionResult Index(ulong guildId, [FromServices] IBot bot,
 
             return RedirectToAction("Index");
         }

        #endregion

        #region StreamerRole

        // GET
        [HttpGet("StreamerRole")]
        public async Task<IActionResult> StreamerRoleSettings(ulong guildId,
            [FromServices] IDiscordGuildService guildService)
        {
            var roles = await guildService.GetRoles(guildId);

            var viewModel = new StreamerRoleSettingsViewModel
            {
                Roles = new SelectList(roles.RemoveManaged(), "Id", "Name")
            };

            var settings = await _streamerRoleSettingsService.GetSettingsByGuild(guildId);

            if (settings == null) return View(viewModel);

            viewModel.RoleId = settings.RoleId;
            viewModel.Enabled = settings.Enabled;

            return View(viewModel);
        }

        // POST
        [HttpPost("StreamerRole")]
        public async Task<IActionResult> StreamerRoleSettings(ulong guildId, StreamerRoleSettingsViewModel viewModel, [FromServices] IBot bot, [FromServices] IDiscordGuildService guildService)
        {
            var botRolePosition = bot.GetBotRoleHierarchy(guildId);

            var roles = await guildService.GetRoles(guildId);

            var selectedRolePosition = roles.FirstOrDefault(r => r.Id == viewModel.RoleId)?.Position;

            // Discord bots cannot assign to roles that are higher then them in the hierarchy.
            if (selectedRolePosition > botRolePosition)
            {
                ModelState.AddModelError("RolePosition", "The bots managed role must be positioned higher then the selected role");

                viewModel.Roles = new SelectList(roles.RemoveManaged(), "Id", "Name");

                return View(viewModel);
            }

            // Save the settings to the database
            await _streamerRoleSettingsService.SaveSettings(new StreamerRoleSettings
            {
                GuildId = guildId,
                Enabled = viewModel.Enabled,
                RoleId = viewModel.RoleId
            });

            return RedirectToAction("Index");
        }

         #endregion
     }
 }
\ No newline at end of file