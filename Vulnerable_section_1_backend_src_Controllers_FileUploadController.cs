 using System.Text;
 using System.Threading;
 using System.Threading.Tasks;
using Database.Data;
 using Database.Authorization;
 using Database.Filters;
 using Database.Utilities;
 using Microsoft.AspNetCore.Http.Features;
 using Microsoft.AspNetCore.Mvc;
 using Microsoft.AspNetCore.WebUtilities;
 using Microsoft.EntityFrameworkCore;
 using Microsoft.Extensions.Logging;
 using Microsoft.Net.Http.Headers;
using Microsoft.AspNetCore.Http;
using Database.Services;
 
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