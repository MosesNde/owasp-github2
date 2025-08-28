     end
 
     if message.blank?
      @errors.push(I18n.t "errors.validation.blank")
     end
     if !message.blank? && message.length < 2
      @errors.push(I18n.t "errors.validation.min_length", min_length: 2)
     end
     if from_email == to_email
      @errors.push(I18n.t "errors.validation.recipient.same_as_user")
     end
     if to_email.blank?
      @errors.push(I18n.t "errors.validation.recipient.blank")
     end
     if @errors.any?
       @message_sent[:message] = @errors.join("\n")