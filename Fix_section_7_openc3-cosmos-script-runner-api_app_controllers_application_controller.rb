     end
     true
   end

  def sanitize_params(param_list, require_params: true, allow_forward_slash: false)
    if require_params
      result = params.require(param_list)
    else
      result = []
      param_list.each do |param|
        result << params[param]
      end
    end
    result.each_with_index do |arg, index|
      if arg
        # Prevent the code scanner detects:
        # "Uncontrolled data used in path expression"
        # This method is taken directly from the Rails source:
        #   https://api.rubyonrails.org/v5.2/classes/ActiveStorage/Filename.html#method-i-sanitized
        if allow_forward_slash
          # Sometimes we have forward slashes so optionally allow those
          value = arg.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�").strip.tr("\u{202E}%$|:;\t\r\n\\", "-")
        else
          value = arg.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�").strip.tr("\u{202E}%$|:;/\t\r\n\\", "-")
        end
        if value != arg
          render(json: { status: 'error', message: "Invalid parameter #{param_list[index]}" }, status: 400)
          return false
        end
      end
    end
    return result
  end
 end