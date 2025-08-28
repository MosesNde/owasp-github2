     has_read_and_write_permission?
   end
 
   sig { returns(T::Boolean) }
 
   def has_read_permission?
    Admin.joins(roles: :permissions).where(
       "users.id = :id AND (roles.name = :admin_name OR permissions.name = :controller_read OR permissions.name = :controller_write)",
       { id: user.id, admin_name: get_admin_role, controller_read: "#{record}:read", controller_write: "#{record}:write" }
     ).exists?
   sig { returns(T::Boolean) }
 
   def has_read_and_write_permission?
    Admin.joins(roles: :permissions).where(
       "users.id = :id AND (roles.name = :admin_name OR permissions.name = :controller_write)",
       { id: user.id, admin_name: get_admin_role, controller_write: "#{record}:write" }
     ).exists?