       hashed_values = Digest::SHA256.hexdigest("#{CurrentUser.name} #{CurrentUser.id} #{time} #{secret}")
       user_hash = "?user_id=#{CurrentUser.id}&username=#{CurrentUser.name}&time=#{time}&hash=#{hashed_values}"
 
      redirect_to(Danbooru.config.discord_site + user_hash, allow_other_host: true)
     end
   end
 