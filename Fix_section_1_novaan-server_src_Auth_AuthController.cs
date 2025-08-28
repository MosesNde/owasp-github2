 
 namespace NovaanServer.Auth
 {
     [Route("api/auth")]
     [ApiController]
     public class AuthController : Controller
             _jwtService = jwtService;
         }
 
        [AllowAnonymous]
         [HttpPost("signup")]
         public async Task<IActionResult> SignUp([FromBody] SignUpDTO signUpDTO)
         {
             await _authService.SignUpWithCredentials(signUpDTO);
             return Ok();
         }
 
        [AllowAnonymous]
         [HttpPost("signin")]
         public async Task<SignInResDTO> SignIn([FromBody] SignInDTOs signInDTO)
         {
             };
         }
 
        [Authorize]
         [HttpPost("refreshtoken")]
         public async Task<RefreshTokenResDTO> RefreshToken()
         {