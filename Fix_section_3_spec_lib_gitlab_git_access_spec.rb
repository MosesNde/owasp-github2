       let(:actor) { key }
 
       context 'pull code' do
        context 'when project is public' do
          let(:project) { create(:project, :public, :repository, *options) }

          context 'when deploy key exists in the project' do
            before do
              key.projects << project
            end

            context 'when the repository is public' do
              let(:options) { %i[repository_enabled] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('You are not allowed to download code from this project.') }
            end
           end
 
          context 'when deploy key does not exist in the project' do
            context 'when the repository is public' do
              let(:options) { %i[repository_enabled] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.to raise_error('You are not allowed to download code from this project.') }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('You are not allowed to download code from this project.') }
            end
          end
         end
 
        context 'when project is internal' do
          let(:project) { create(:project, :internal, :repository, *options) }
 
          context 'when deploy key exists in the project' do
            before do
              key.projects << project
            end

            context 'when the repository is public' do
              let(:options) { %i[repository_enabled] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('You are not allowed to download code from this project.') }
            end
           end
 
          context 'when deploy key does not exist in the project' do
            context 'when the repository is public' do
              let(:options) { %i[repository_enabled] }
 
              it { expect { pull_access_check }.to raise_error('The project you were looking for could not be found.') }
            end

            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.to raise_error('The project you were looking for could not be found.') }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('The project you were looking for could not be found.') }
            end
           end
        end
 
        context 'when project is private' do
          let(:project) { create(:project, :private, :repository, *options) }
 
          context 'when deploy key exists in the project' do
            before do
              key.projects << project
            end

            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.not_to raise_error }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('You are not allowed to download code from this project.') }
            end
          end

          context 'when deploy key does not exist in the project' do
            context 'when the repository is private' do
              let(:options) { %i[repository_private] }

              it { expect { pull_access_check }.to raise_error('The project you were looking for could not be found.') }
            end

            context 'when the repository is disabled' do
              let(:options) { %i[repository_disabled] }

              it { expect { pull_access_check }.to raise_error('The project you were looking for could not be found.') }
            end
           end
         end
       end