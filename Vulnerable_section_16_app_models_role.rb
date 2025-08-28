   def has_default_role_changed?
     name = name_before_last_save
     if Rails.configuration.default_roles.any? { |r| r[:name] == name }
      self.errors[:base] << I18n.t("errors.validation.default_roles")
     end
   end
 end