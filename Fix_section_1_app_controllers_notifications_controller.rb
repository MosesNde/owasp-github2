     uniqueid = notification[:uniqueid]
     data = convert_to_hash(notification[:data])
     # In case data[:name] is invalid
    if data[:user_id]
      data[:email] = User.find(data[:user_id]).email
    end
     case data[:type]
     when /comment/ then comment_link(uniqueid, data)
     when /accepted_ally_request/ then accepted_ally_link(uniqueid, data)