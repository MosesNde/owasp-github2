 
     it_behaves_like 'handling get metadata requests', scope: :project
     it_behaves_like 'accept get request on private project with access to package registry for everyone'
    it_behaves_like 'rejects invalid package names' do
      subject { get(url) }
    end
   end
 
   describe 'GET /api/v4/projects/:id/packages/npm/-/package/*package_name/dist-tags' do