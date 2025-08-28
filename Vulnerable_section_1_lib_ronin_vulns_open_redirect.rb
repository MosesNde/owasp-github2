                 http-equiv\s*=\s*(?: "refresh" | 'refresh' | refresh )\s+
                 content\s*=\s*
                 (?:
                 "\s*\d+\s*;\s*url\s*=\s*'\s*#{escaped_test_url}\s*'\s*"|
                 '\s*\d+\s*;\s*url\s*=\s*"\s*#{escaped_test_url}\s*"\s*'|
                 \s*\d+;url=(?: "#{escaped_test_url}" | '#{escaped_test_url}' )
                 )\s*
                 (?:/\s*)?>
             }xi