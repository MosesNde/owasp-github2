     expect(response).to redirect_to(redirect_path)
   end
 
  context 'with encoded subgroup path' do
    where(:jira_path, :redirect_path) do
      '/group/group@sub_group@sub_group_project'                | '/group/sub_group/sub_group_project'
      '/group@sub_group/group@sub_group@sub_group_project'      | '/group/sub_group/sub_group_project'
      '/group/group@sub_group@sub_group_project/commit/1234567' | '/group/sub_group/sub_group_project/commit/1234567'
      '/group/group@sub_group@sub_group_project/tree/1234567'   | '/group/sub_group/sub_group_project/-/tree/1234567'
     end
 
    with_them do
      context 'with legacy prefix' do
        it 'redirects to canonical path' do
          redirects_to_canonical_path "/-/jira#{jira_path}", redirect_path
        end
      end

      it 'redirects to canonical path' do
        redirects_to_canonical_path jira_path, redirect_path
      end
     end
   end
 
   context 'regular paths with legacy prefix' do
     where(:jira_path, :redirect_path) do
       '/-/jira/group/group_project'                | '/group/group_project'