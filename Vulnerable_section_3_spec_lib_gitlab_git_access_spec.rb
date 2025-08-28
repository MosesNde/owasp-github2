       let(:actor) { key }
 
       context 'pull code' do
        context 'when project is authorized' do
          before do
            key.projects << project
           end
 
          it { expect { pull_access_check }.not_to raise_error }
         end
 
        context 'when unauthorized' do
          context 'from public project' do
            let(:project) { create(:project, :public, :repository) }
 
            it { expect { pull_access_check }.not_to raise_error }
           end
 
          context 'from internal project' do
            let(:project) { create(:project, :internal, :repository) }
 
            it { expect { pull_access_check }.to raise_not_found }
           end
 
          context 'from private project' do
            let(:project) { create(:project, :private, :repository) }
 
            it { expect { pull_access_check }.to raise_not_found }
           end
         end
       end