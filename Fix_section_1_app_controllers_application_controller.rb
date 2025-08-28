 		correct_id = resource.to_param
 		if correct_id != params[id_param_name]
 			params[id_param_name] = correct_id
			redirect_to params.merge(:only_path => true), :status => 301
 			return true
 		end
 		return false