   describe 'GET /api/v4/packages/npm/*package_name' do
     let(:url) { api("/packages/npm/#{package_name}") }
 
    subject { get(url) }

     it_behaves_like 'handling get metadata requests', scope: :instance
    it_behaves_like 'rejects invalid package names'
 
     context 'with a duplicate package name in another project' do
       let_it_be(:project2) { create(:project, :public, namespace: namespace) }
       let_it_be(:package2) do
         create(:npm_package,