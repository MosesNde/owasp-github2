           end
 
           helpers do
            params :package_name do
              requires :package_name, type: String, file_path: true, desc: 'Package name',
                documentation: { example: 'mypackage' }
            end

             def redirect_or_present_audit_report
               redirect_registry_request(
                 forward_to_registry: true,
             tags %w[npm_packages]
           end
           params do
            use :package_name
           end
           route_setting :authentication, job_token_allowed: true, deploy_token_allowed: true
           get '*package_name', format: false, requirements: ::API::Helpers::Packages::Npm::NPM_ENDPOINT_REQUIREMENTS do