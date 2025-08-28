       assert_redirected_to_top_level(shopify_domain)
     end
 
    test '#new stores root path when return_to url is absolute' do
      get :new, params: { shop: 'my-shop', return_to: '//example.com' }
      assert_equal '/', session[:return_to]
    end

    test '#new stores only relative path for return_to in the session' do
      get :new, params: { shop: 'my-shop', return_to: '/page' }
      assert_equal '/page', session[:return_to]
    end

     test '#new sets the top_level_oauth cookie if a valid shop param exists and user agent supports cookie partitioning' do
       request.env['HTTP_USER_AGENT'] = 'Version/12.0 Safari'
       get :new, params: { shop: 'my-shop' }