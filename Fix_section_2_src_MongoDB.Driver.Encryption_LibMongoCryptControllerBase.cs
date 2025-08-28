             var tlsStreamSettings = GetTlsStreamSettings(request.KmsProvider);
             var sslStreamFactory = new SslStreamFactory(tlsStreamSettings, _networkStreamFactory);
             using (var sslStream = sslStreamFactory.CreateStream(endpoint, cancellation))
            using (var binary = request.GetMessage())
             {
                var requestBytes = binary.ToArray();
                 sslStream.Write(requestBytes, 0, requestBytes.Length);
 
                 while (request.BytesNeeded > 0)
             var tlsStreamSettings = GetTlsStreamSettings(request.KmsProvider);
             var sslStreamFactory = new SslStreamFactory(tlsStreamSettings, _networkStreamFactory);
             using (var sslStream = await sslStreamFactory.CreateStreamAsync(endpoint, cancellation).ConfigureAwait(false))
            using (var binary = request.GetMessage())
             {
                var requestBytes = binary.ToArray();
                 await sslStream.WriteAsync(requestBytes, 0, requestBytes.Length).ConfigureAwait(false);
 
                 while (request.BytesNeeded > 0)