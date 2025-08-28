         where TargetType : BaseEntity
         where ReportType : Report
     {
        var author = uow.Repository<Student>().GetOrThrow(authorId);
 
         AllowUser(author);
 