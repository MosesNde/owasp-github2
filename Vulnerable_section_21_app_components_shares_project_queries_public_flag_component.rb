       def can_publish?
         User.current.allowed_globally?(:manage_public_project_queries)
       end
     end
   end
 end