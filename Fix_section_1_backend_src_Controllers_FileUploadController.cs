 using System.Text;
 using System.Threading;
 using System.Threading.Tasks;
 using Database.Authorization;
using Database.Data;
 using Database.Filters;
using Database.Services;
 using Database.Utilities;
using Microsoft.AspNetCore.Http;
 using Microsoft.AspNetCore.Http.Features;
 using Microsoft.AspNetCore.Mvc;
 using Microsoft.AspNetCore.WebUtilities;
 using Microsoft.EntityFrameworkCore;
 using Microsoft.Extensions.Logging;
 using Microsoft.Net.Http.Headers;
 
 namespace Database.Controllers;
 
         }
         if (!FileUploadDataAuthorization.IsAuthorizedToUploadFilesForInstitution(
             currentUser,
             getHttpsResource.Data.CreatorId,
             _appSettings,
             _httpClientFactory,
             _httpContextAccessor,
             cancellationToken
             )
         )
         {
             return Unauthorized();