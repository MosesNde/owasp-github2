     {
         PropertyNameCaseInsensitive = true
     };

    public List<AudioFile> Files => _audioFiles.ToList();

     public static AudioService CreateInstance()
     {
         // requires `dotnet publish`
     {
         return _audioFiles.Where(x => x.Words.Contains(word, CaseInsensitiveWordComparer.Default)).ToList();
     }

    public bool ContainsFileNamed(string name) => Files.Any(x => x.FileNameNoExtension == name);
 }
 
 // non-null not initialised
 #pragma warning disable CS8618 
 [SuppressMessage("ReSharper", "UnusedAutoPropertyAccessor.Global")]
 [SuppressMessage("ReSharper", "PropertyCanBeMadeInitOnly.Global")]
 [SuppressMessage("ReSharper", "UnusedMember.Global")]
public record AudioFile
 {
     public string FilePath { get; set; }
    public string FileNameNoExtension => Path.GetFileNameWithoutExtension(FilePath);
     public string Transcription { get; set; }
     public string[] Words { get; set; }
     public bool IsKnownData { get; set; }