 require 'spec_helper'
 
describe 'members/agents/nodes/login', type: :feature, dbscope: :example do
   describe "ss-2724" do
     let(:root_site) { cms_site }
     let(:site1) { create(:cms_site_subdir, domains: root_site.domains) }
       expect(page).to have_css(".form-login")
     end
   end
 end