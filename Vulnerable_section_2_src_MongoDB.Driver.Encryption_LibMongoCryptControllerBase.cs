             var tlsStreamSettings = GetTlsStreamSettings(request.KmsProvider);
             var sslStreamFactory = new SslStreamFactory(tlsStreamSettings, _networkStreamFactory);
             using (var sslStream = sslStreamFactory.CreateStream(endpoint, cancellation))
             {
                var requestBytes = request.Message.ToArray();
                 sslStream.Write(requestBytes, 0, requestBytes.Length);
 
                 while (request.BytesNeeded > 0)
             var tlsStreamSettings = GetTlsStreamSettings(request.KmsProvider);
             var sslStreamFactory = new SslStreamFactory(tlsStreamSettings, _networkStreamFactory);
             using (var sslStream = await sslStreamFactory.CreateStreamAsync(endpoint, cancellation).ConfigureAwait(false))
             {
                var requestBytes = request.Message.ToArray();
                 await sslStream.WriteAsync(requestBytes, 0, requestBytes.Length).ConfigureAwait(false);
 
                 while (request.BytesNeeded > 0)