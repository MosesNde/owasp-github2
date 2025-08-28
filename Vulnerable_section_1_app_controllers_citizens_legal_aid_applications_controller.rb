     end
 
     def expired
      redirect_to citizens_resend_link_request_path(params[:id])
     end
 
     def start_applicant_flow
       session[:current_application_id] = legal_aid_application.id
       session[:page_history_id] = SecureRandom.uuid
     end
   end
 end