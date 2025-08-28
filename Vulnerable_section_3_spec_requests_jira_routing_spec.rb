     let(:redirect_path) { '/group/sub_group/sub_group_project/commit/1234567' }
 
     it_behaves_like 'redirects to jira path'
   end
 
   context 'including tree path' do
     let(:redirect_path) { '/malicious.server' }
 
     it_behaves_like 'redirects to jira path'
   end
 
   context 'regular paths with legacy prefix' do