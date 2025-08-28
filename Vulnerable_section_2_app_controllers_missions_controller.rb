 
   def update
     if @mission.update(mission_params)
      if params[:redirect]
        redirect_to({ action: params[:redirect] }, notice: I18n.t(:update_mission, scope: :notice))
       else
         redirect_to mission_path(@mission), notice: I18n.t(:update_mission, scope: :notice)
       end