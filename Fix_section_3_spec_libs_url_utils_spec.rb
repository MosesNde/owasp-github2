         'secure simple third party host' => 'http://www.google.com/',
         'secure simple third party host no trailing slash' => 'http://www.google.com',
         'malicious host masquerading with question mark' => 'http://malicious.org?www.greatschools.org',
        'another variant with question mark' => 'http://abr1k0s.ru?www.greatschools.org',
         'malicious host masquerading with ampersand' => 'http://malicious.org&www.greatschools.org',
         'secure malicious host masquerading with question mark' => 'https://malicious.org?www.greatschools.org',
         'secure malicious host masquerading with ampersand' => 'https://malicious.org&www.greatschools.org',
        'scheme relative malicious host' => '//www.evil.com'
     }.each do |description, url|
       describe "given a #{description} URL" do
         let (:uri) { url }