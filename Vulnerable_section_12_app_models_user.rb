 
   # Méthode pour personnaliser les claims JWT
   def jwt_payload
    {
       user_id: id,
       name: name,
      email: email
     }
   end
 end