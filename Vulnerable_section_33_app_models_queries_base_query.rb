       :activerecord
     end
 
    # Use the Query class' error messages.
    # So everything under
     #
     # activerecord.errors.models.query
    #
    # is found.
     def lookup_ancestors
      [Query]
     end
   end
 