 
     def allowed_to_modify_private_query
       return if model.public?
      return if model.user == user
      return if user.allowed_in_project_query?(:edit_project_query, model)
 
      errors.add :base, :can_only_be_modified_by_owner
     end
 
     def allowed_to_modify_public_query
       return unless model.public?
      return if user.allowed_in_project_query?(:edit_project_query, model)
      return if user.allowed_globally?(:manage_public_project_queries)
 
      errors.add :base, :need_permission_to_modify_public_query
     end
 
     def name_select_included