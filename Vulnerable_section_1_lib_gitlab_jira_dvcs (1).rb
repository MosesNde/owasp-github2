       # @param [String] namespace
       def self.restore_full_path(namespace:, project:)
         if project.include?(ENCODED_SLASH)
          project.gsub(ENCODED_SLASH, SLASH)
         else
           "#{namespace}/#{project}"
         end