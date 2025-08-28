                  DateTime startDate, DateTime endDate, string location, int? capacity, decimal? fee)
     {
         AllowOrganizers();

         Student student = uow.Repository<Student>().GetOrThrow(studentGuid);
 
         Event @event = new Event(student, title, description, category, publicationDate,
             startDate, endDate, location, capacity, fee);
         uow.Repository<Event>().Add(@event);