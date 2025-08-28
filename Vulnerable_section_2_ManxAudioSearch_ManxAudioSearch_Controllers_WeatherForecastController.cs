     [HttpGet]
     public IEnumerable<object> Get()
     {
        Phrase ToPhrase(AudioFile file) => new(file.FileName, file.Transcription);
         var words = _audioService
             .GetWords()
             .Select(word => 