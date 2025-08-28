 # https://guides.rubyonrails.org/configuring.html#config-action-controller-raise-on-open-redirects
 # Protect from open redirect attacks in `redirect_back_or_to` and `redirect_to`.
 # Previous versions had false. Rails 7.0+ default is true.
Rails.application.config.action_controller.raise_on_open_redirects = true
 
 # https://guides.rubyonrails.org/configuring.html#config-active-storage-variant-processor
 # Change the variant processor for Active Storage.