       user.allowed_in_project?(:view_shared_work_packages, @entity.project)
     end
 
     def create_contract_class
       Shares::WorkPackages::CreateContract
     end
     def delete_contract_class
       Shares::WorkPackages::DeleteContract
     end
   end
 end