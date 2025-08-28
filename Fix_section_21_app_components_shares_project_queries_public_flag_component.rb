       def can_publish?
         User.current.allowed_globally?(:manage_public_project_queries)
       end

      def tooltip_message
        return if can_publish?

        I18n.t("sharing.project_queries.publishing_denied")
      end

      def tooltip_wrapper_classes
        ["d-flex", "flex-column"].tap do |classlist|
          classlist << "tooltip--bottom" unless can_publish?
        end
      end
     end
   end
 end