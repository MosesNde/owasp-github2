         before do
           allow(ArtsyAPI).to receive_message_chain(:client, :applications, :_post)
         end
        ['http://google.com', 'http:/google.com'].each do |url|
          it "is not vulnerable to an open redirect to #{url}" do
            visit "/client_applications/new?redirect_uri=#{url}"
            fill_in 'Name', with: 'Name'
            click_button 'Save'
            expect(current_url).to end_with '/client_applications'
          end
         end
         it 'redirects to a relative uri' do
           visit '/client_applications/new?redirect_uri=/docs'