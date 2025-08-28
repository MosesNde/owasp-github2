       it 'returns decoded project path' do
         expect(described_class.restore_full_path(namespace: 'group1', project: 'group1@group2@project1')).to eq('group1/group2/project1')
       end
     end
 
     context 'project name is not an encoded full path' do