         let(:custom_path) { edit_course_path(course) }
         let(:valid_attributes) { {
           title: 'Attendance Event Title',
          redirect_to_course: course.id,
         } }
 
        it 'redirects to the specified course edit page' do
           subject
          expect(response).to redirect_to(edit_course_path(course.id))
         end
       end
     end