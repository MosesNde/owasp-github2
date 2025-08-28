     [HttpGet]
     public IEnumerable<object> Get()
     {
        Phrase ToPhrase(AudioFile file) => new(file.FileNameNoExtension, file.Transcription);
         var words = _audioService
             .GetWords()
             .Select(word => 