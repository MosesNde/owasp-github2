   include Devise::JWT::RevocationStrategies::Denylist
 
   self.table_name = 'jwt_denylists'

  # Ajouter des validations pour s'assurer que les champs requis sont présents
  validates :jti, presence: true
  validates :exp, presence: true
 end