 
   def update
     if @mission.update(mission_params)
      if params[:redirect].present?
        redirect_back fallback_location: mission_path(@mission), notice: I18n.t(:update_mission, scope: :notice)
       else
         redirect_to mission_path(@mission), notice: I18n.t(:update_mission, scope: :notice)
       end