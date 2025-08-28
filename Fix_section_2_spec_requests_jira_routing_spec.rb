     expect(response).to redirect_to(redirect_path)
   end
 
  shared_examples 'redirects to jira path' do
    it 'redirects to canonical path with legacy prefix' do
      redirects_to_canonical_path "/-/jira#{jira_path}", redirect_path
     end
 
    it 'redirects to canonical path' do
      redirects_to_canonical_path jira_path, redirect_path
     end
   end
 
  let(:jira_path) { '/group/group@sub_group@sub_group_project' }
  let(:redirect_path) { '/group/sub_group/sub_group_project' }

  it_behaves_like 'redirects to jira path'

  context 'contains @ before the first /' do
    let(:jira_path) { '/group@sub_group/group@sub_group@sub_group_project' }
    let(:redirect_path) { '/group/sub_group/sub_group_project' }

    it_behaves_like 'redirects to jira path'
  end

  context 'including commit path' do
    let(:jira_path) { '/group/group@sub_group@sub_group_project/commit/1234567' }
    let(:redirect_path) { '/group/sub_group/sub_group_project/commit/1234567' }

    it_behaves_like 'redirects to jira path'
  end

  context 'including tree path' do
    let(:jira_path) { '/group/group@sub_group@sub_group_project/tree/1234567' }
    let(:redirect_path) { '/group/sub_group/sub_group_project/-/tree/1234567' }

    it_behaves_like 'redirects to jira path'
  end

  context 'malicious path' do
    let(:jira_path) { '/group/@@malicious.server' }
    let(:redirect_path) { '/malicious.server' }

    it_behaves_like 'redirects to jira path'
  end

   context 'regular paths with legacy prefix' do
     where(:jira_path, :redirect_path) do
       '/-/jira/group/group_project'                | '/group/group_project'