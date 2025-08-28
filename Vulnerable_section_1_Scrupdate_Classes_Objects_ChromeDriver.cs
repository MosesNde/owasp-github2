                     chromeOptions.AddUserProfilePreference("profile.default_content_setting_values.images", 2);
                     chromeOptions.AddUserProfilePreference("profile.managed_default_content_settings.images", 2);
                 }
                ChromeDriverService chromeDriverService = null;
                 try
                 {
                     chromeDriverService = ChromeDriverService.CreateDefaultService(