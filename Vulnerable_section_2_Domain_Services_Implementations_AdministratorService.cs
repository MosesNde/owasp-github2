 
 public class AdministratorService(IUnitOfWork uow) : BaseService<IAdministratorService, AdministratorService>(uow), IAdministratorService
 {
    public Administrator GetAdministrator(Guid guid) => uow.Repository<Administrator>().GetOrThrow(guid);
 
     public Administrator CreateAdministrator(string firstName, string lastName, string email, string? externalId = null)
     {