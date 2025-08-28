     end
 
     if message.blank?
      @errors.push(I18n.t "errors.messages.blank")
     end
     if !message.blank? && message.length < 2
      @errors.push(I18n.t "errors.messages.min_length", min_length: 2)
     end
     if from_email == to_email
      @errors.push(I18n.t "errors.messages.recipient.same_as_user")
     end
     if to_email.blank?
      @errors.push(I18n.t "errors.messages.recipient.blank")
     end
     if @errors.any?
       @message_sent[:message] = @errors.join("\n")