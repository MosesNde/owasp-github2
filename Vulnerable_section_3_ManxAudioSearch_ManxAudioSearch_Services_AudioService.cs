     {
         PropertyNameCaseInsensitive = true
     };
    
     public static AudioService CreateInstance()
     {
         // requires `dotnet publish`
     {
         return _audioFiles.Where(x => x.Words.Contains(word, CaseInsensitiveWordComparer.Default)).ToList();
     }
 }
 
 // non-null not initialised
 #pragma warning disable CS8618 
 [SuppressMessage("ReSharper", "UnusedAutoPropertyAccessor.Global")]
 [SuppressMessage("ReSharper", "PropertyCanBeMadeInitOnly.Global")]
 [SuppressMessage("ReSharper", "UnusedMember.Global")]
public class AudioFile
 {
     public string FilePath { get; set; }
    public string FileName => Path.GetFileNameWithoutExtension(FilePath);
     public string Transcription { get; set; }
     public string[] Words { get; set; }
     public bool IsKnownData { get; set; }