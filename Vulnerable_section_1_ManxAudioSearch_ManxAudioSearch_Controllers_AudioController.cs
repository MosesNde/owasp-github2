using Microsoft.AspNetCore.Mvc;
 
 namespace ManxAudioSearch.Controllers;
 
 [ApiController]
 [Route("[controller]")]
 public class AudioController : ControllerBase
 {
     [HttpGet("{name}")]
     public ActionResult Get(string name)
     {
        Console.Error.WriteLine("BUG: FILESYSTEM READS");
         var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "publish", "wwwroot", "audio", name + ".mp3");
         using var fs = new FileStream(path, FileMode.Open, FileAccess.Read);
                