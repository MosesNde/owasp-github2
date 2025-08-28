     let(:redirect_path) { '/group/sub_group/sub_group_project/commit/1234567' }
 
     it_behaves_like 'redirects to jira path'

    context 'malicious path with @path' do
      let(:jira_path) { '/group/@b/commit/1234567' }
      let(:redirect_path) { '/b/commit/1234567' }

      it_behaves_like 'redirects to jira path'
    end
   end
 
   context 'including tree path' do
     let(:redirect_path) { '/malicious.server' }
 
     it_behaves_like 'redirects to jira path'

    context 'malicious path with @project' do
      let(:jira_path) { '/group/@malicious.server/tree/x' }
      let(:redirect_path) { '/malicious.server/-/tree/x' }

      it_behaves_like 'redirects to jira path'
    end
   end
 
   context 'regular paths with legacy prefix' do