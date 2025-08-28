using System.ComponentModel;
 using System.ComponentModel.DataAnnotations;
 using Microsoft.AspNetCore.Mvc.Rendering;
 
 namespace Volvox.Helios.Web.ViewModels.Settings
 {
     public class StreamAnnouncerSettingsViewModel
     {
         public SelectList Channels { get; set; }