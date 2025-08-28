     public Comment CreateComment(Guid authorGuid, Guid postGuid, string content, Guid inResponseToGuid = new Guid(), DateTime? creationDate = null)
     {
         Student author = uow.Repository<Student>().GetOrThrow(authorGuid);

         AllowUser(author);
 
         Post post = uow.Repository<Post>().GetOrThrow(postGuid);