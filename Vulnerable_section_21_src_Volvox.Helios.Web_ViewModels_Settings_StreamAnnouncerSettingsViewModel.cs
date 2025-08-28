﻿using System.Collections.Generic;
using System.ComponentModel;
 using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Authorization;
 using Microsoft.AspNetCore.Mvc.Rendering;
using Volvox.Helios.Domain.Discord;
 
 namespace Volvox.Helios.Web.ViewModels.Settings
 {
    [Authorize]
     public class StreamAnnouncerSettingsViewModel
     {
         public SelectList Channels { get; set; }