       end
 
       def _url_host_allowed?(url)
        [request.host, nil].include?(URI(url.to_s).host)
       rescue ArgumentError, URI::Error
         false
       end