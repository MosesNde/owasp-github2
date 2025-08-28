           version: '1.2.0')
       end
 
      it_behaves_like 'rejects invalid package names'

       it 'includes all matching package versions in the response' do
         subject
 