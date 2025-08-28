         fill_in 'Name', with: 'Name'
         click_button 'Save'
       end
      context 'open-redirect' do
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
          fill_in 'Name', with: 'Name'
          click_button 'Save'
          expect(current_url).to end_with '/docs'
        end
        it 'redirects to a full uri' do
          visit '/docs'
          redirect_uri = current_url
          visit "/client_applications/new?redirect_uri=#{redirect_uri}"
          fill_in 'Name', with: 'Name'
          click_button 'Save'
          expect(current_url).to eq redirect_uri
        end
      end
     end
     context 'with an application' do
       let(:application) do