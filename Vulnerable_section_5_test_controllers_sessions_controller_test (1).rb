       assert_redirected_to_top_level(shopify_domain)
     end
 
     test '#new sets the top_level_oauth cookie if a valid shop param exists and user agent supports cookie partitioning' do
       request.env['HTTP_USER_AGENT'] = 'Version/12.0 Safari'
       get :new, params: { shop: 'my-shop' }