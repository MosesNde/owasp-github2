   protected
 
   def index
    @objects = "#{default_class_name}Policy::Scope".constantize.new(default_class, get_controller_name).resolve()
   end
 
   def new
 
   def update
     respond_to do |format|
      if get_default_service.update(permitted_params, @object).valid?
         format.html {
           redirect_to get_default_path,
                       notice: t("layout.action_text.updated", object_name: default_class.model_name.human, :gender => :n)
   end
 
   def get_default_service
    class_name = default_class_name
    constant_class = "Backoffice::#{class_name.pluralize}Controller::#{class_name}Service".constantize
    constant_class
   end
 
   def get_default_path
   end
 
   def permitted_params
    permitted_attributes = get_current_class_policy.new(default_class, get_controller_name).permitted_attributes
    params.require(default_class_name.underscore.to_sym).permit(permitted_attributes)
  end

  def default_class
    default_class_name.constantize
  end

  def get_current_class_policy
    "#{default_class_name}Policy".constantize
   end
 
   private
 
  def default_class_name
    controller_name.classify
   end
 end