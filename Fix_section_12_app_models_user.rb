 
   # Méthode pour personnaliser les claims JWT
   def jwt_payload
    Rails.logger.info("User#jwt_payload - Générant payload pour utilisateur: #{id}, #{email}")

    payload = {
       user_id: id,
      email: email,
       name: name,
      jti: SecureRandom.uuid,
      exp: (Time.now + 24.hours).to_i
     }

    Rails.logger.info("User#jwt_payload - Payload généré: #{payload.inspect}")
    payload
   end
 end