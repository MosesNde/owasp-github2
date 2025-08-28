         where TargetType : BaseEntity
         where ReportType : Report
     {
        var author = uow.Repository<User>().GetOrThrow(authorId);
 
         AllowUser(author);
 