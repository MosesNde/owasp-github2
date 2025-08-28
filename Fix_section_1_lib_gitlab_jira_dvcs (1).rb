       def self.restore_full_path(namespace:, project:)
         if project.include?(ENCODED_SLASH)
           # Replace multiple slashes with single ones to make sure the redirect stays on the same host
          # full_path should not start with a `/`
          project.gsub(ENCODED_SLASH, SLASH).gsub(%r{\/{2,}}, '/').gsub(%r{^\/}, '')
         else
           "#{namespace}/#{project}"
         end