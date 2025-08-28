         private void Refresh()
         {
             var client = CreateClient(TokenUrl, this.clientId);
             var request = new RestRequest("api/v1/access_token", Method.POST);
             request.AddParameter("grant_type", "refresh_token");
             request.AddParameter("refresh_token", this.apikey.refresh);