       :activerecord
     end
 
    # Also use the Query class' as a lookup ancestor so that error messages, etc can be shared.
    # So if nothing is defined for the specific query class, we fall back to the generic query class.
     #
    # This is useful for error messages, because we can fall back to error messages, etc in
     # activerecord.errors.models.query
     def lookup_ancestors
      super + [Query]
     end
   end
 