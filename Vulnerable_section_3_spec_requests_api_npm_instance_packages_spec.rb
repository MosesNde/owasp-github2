   describe 'GET /api/v4/packages/npm/*package_name' do
     let(:url) { api("/packages/npm/#{package_name}") }
 
     it_behaves_like 'handling get metadata requests', scope: :instance
 
     context 'with a duplicate package name in another project' do
      subject { get(url) }

       let_it_be(:project2) { create(:project, :public, namespace: namespace) }
       let_it_be(:package2) do
         create(:npm_package,