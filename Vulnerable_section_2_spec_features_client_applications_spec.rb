         before do
           allow(ArtsyAPI).to receive_message_chain(:client, :applications, :_post)
         end
        it 'does not have an open redirect' do
          visit '/client_applications/new?redirect_uri=http://google.com'
          fill_in 'Name', with: 'Name'
          click_button 'Save'
          expect(current_url).to end_with '/client_applications'
         end
         it 'redirects to a relative uri' do
           visit '/client_applications/new?redirect_uri=/docs'