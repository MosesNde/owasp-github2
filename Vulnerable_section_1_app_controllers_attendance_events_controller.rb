       event_type: create_params[:event_type],
     )
 
     respond_to do |format|
       format.html { redirect_to(
        create_params[:redirect_to] || attendance_events_path,
         notice: 'Attendance event was successfully created.'
       ) }
       format.json { head :no_content }
     params.require(:attendance_event).permit(
       :title,
       :event_type,
      :redirect_to,
     )
   end
 end