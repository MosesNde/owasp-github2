     redirect_back_or_to "http://www.rubyonrails.org/"
   end
 
  def unsafe_redirect_malformed
    redirect_to "http:///www.rubyonrails.org/"
  end

   def only_path_redirect
     redirect_to action: "other_host", only_path: true
   end
     end
   end
 
  def test_unsafe_redirect_with_malformed_url
    with_raise_on_open_redirects do
      error = assert_raise(ActionController::Redirecting::UnsafeRedirectError) do
        get :unsafe_redirect_malformed
      end

      assert_equal "Unsafe redirect to \"http:///www.rubyonrails.org/\", pass allow_other_host: true to redirect anyway.", error.message
    end
  end

   def test_only_path_redirect
     with_raise_on_open_redirects do
       get :only_path_redirect