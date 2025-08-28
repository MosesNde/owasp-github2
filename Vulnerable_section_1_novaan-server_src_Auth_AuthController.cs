 
 namespace NovaanServer.Auth
 {
    [AllowAnonymous]
     [Route("api/auth")]
     [ApiController]
     public class AuthController : Controller
             _jwtService = jwtService;
         }
 
         [HttpPost("signup")]
         public async Task<IActionResult> SignUp([FromBody] SignUpDTO signUpDTO)
         {
             await _authService.SignUpWithCredentials(signUpDTO);
             return Ok();
         }
 
         [HttpPost("signin")]
         public async Task<SignInResDTO> SignIn([FromBody] SignInDTOs signInDTO)
         {
             };
         }
 
         [HttpPost("refreshtoken")]
         public async Task<RefreshTokenResDTO> RefreshToken()
         {