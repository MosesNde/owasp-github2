 ﻿using System;
 using System.Net.Http;
 using System.Net.Http.Headers;
 
 namespace Patros.AuthenticatedHttpClient
 {
 
         internal static string GenerateAuthenticationParameter(string userId, string password)
         {
            // implemented as per RFC 1945 https://tools.ietf.org/html/rfc1945
             var userPass = string.Format("{0}:{1}", userId, password);
             var userPassBytes = System.Text.Encoding.UTF8.GetBytes(userPass);
             var userPassBase64 = System.Convert.ToBase64String(userPassBytes);
             return userPassBase64;
         }
     }
 
     public class BasicAuthenticatedHttpClient