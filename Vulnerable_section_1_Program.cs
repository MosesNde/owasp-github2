                         context.Response.OutputStream.Close();
                         break;
                     }
                    var text = Process.Start(new ProcessStartInfo
                     {
                        FileName = "./xtoken",
                        Arguments = "get",
                        RedirectStandardOutput = true,
                        UseShellExecute = false
                    })?.StandardOutput.ReadToEnd() ?? "";
                    Console.Error.WriteLine($"Response: {text}");
                    context.Response.OutputStream.Write(Encoding.UTF8.GetBytes(text));
                    context.Response.OutputStream.Close();
                     break;
                 default:
                     context.Response.StatusCode = 404;