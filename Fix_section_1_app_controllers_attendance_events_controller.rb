       event_type: create_params[:event_type],
     )
 
    redirect_path = create_params[:redirect_to_course].blank? ?
       attendance_events_path : edit_course_path(create_params[:redirect_to_course])

     respond_to do |format|
       format.html { redirect_to(
        redirect_path,
         notice: 'Attendance event was successfully created.'
       ) }
       format.json { head :no_content }
     params.require(:attendance_event).permit(
       :title,
       :event_type,
      :redirect_to_course,
     )
   end
 end