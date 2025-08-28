                 }
             }
         }
        
         [Fact]
         public void TestAwsKeyCreationWithEndPoint()
         {
                         var requests = context.GetKmsMessageRequests();
                         foreach (var req in requests)
                         {
                            var binary = req.Message;
                             _output.WriteLine("Key Document: " + binary);
                             var postRequest = binary.ToString();
                             // TODO: add different hosts handling