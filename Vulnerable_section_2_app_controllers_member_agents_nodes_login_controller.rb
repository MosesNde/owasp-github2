       remote_addr: remote_addr,
       user_agent: request.user_agent)
 
    ref = URI::decode(params[:ref] || flash[:ref] || "")
    ref = redirect_url if ref.blank?
     flash.discard(:ref)
 
     redirect_to ref
   end
 
   public
 
   def login