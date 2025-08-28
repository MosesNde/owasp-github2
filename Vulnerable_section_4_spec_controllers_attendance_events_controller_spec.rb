         let(:custom_path) { edit_course_path(course) }
         let(:valid_attributes) { {
           title: 'Attendance Event Title',
          redirect_to: custom_path,
         } }
 
        it 'redirects to the specified path' do
           subject
          expect(response).to redirect_to(custom_path)
         end
       end
     end