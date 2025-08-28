     end
 
     def expired
      redirect_to citizens_resend_link_request_path(application_id_param)
     end
 
     def start_applicant_flow
       session[:current_application_id] = legal_aid_application.id
       session[:page_history_id] = SecureRandom.uuid
     end

    def application_id_param
      params.require(:id)
    end
   end
 end