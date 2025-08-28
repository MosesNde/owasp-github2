   protected
 
   def index
    @objects = policy_scope(default_class)
   end
 
   def new
 
   def update
     respond_to do |format|
      if get_default_service.update(permitted_params, @object)
         format.html {
           redirect_to get_default_path,
                       notice: t("layout.action_text.updated", object_name: default_class.model_name.human, :gender => :n)
   end
 
   def get_default_service
   end
 
   def get_default_path
   end
 
   def permitted_params
    permitted_attributes = policy(current_user).permitted_attributes
    params.require(controller_name.classify.underscore.to_sym).permit(permitted_attributes)
   end
 
   private
 
  def default_class
    controller_name.classify.constantize
   end
 end