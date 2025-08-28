       def self.restore_full_path(namespace:, project:)
         if project.include?(ENCODED_SLASH)
           # Replace multiple slashes with single ones to make sure the redirect stays on the same host
          project.gsub(ENCODED_SLASH, SLASH).gsub(%r{\/{2,}}, '/')
         else
           "#{namespace}/#{project}"
         end