 require 'spec_helper'
 
describe 'members/agents/nodes/login', type: :feature, dbscope: :example, js: true do
   describe "ss-2724" do
     let(:root_site) { cms_site }
     let(:site1) { create(:cms_site_subdir, domains: root_site.domains) }
       expect(page).to have_css(".form-login")
     end
   end

  describe "open redirect" do
    let(:site) { cms_site }
    let(:layout) { create_cms_layout(cur_site: site) }
    let(:index_page) { create :cms_page, cur_site: site, layout: layout, filename: "index.html", html: "you've been logged in" }
    let!(:login_node) do
      create(
        :member_node_login, cur_site: site, layout: layout, redirect_url: index_page.url, form_auth: "enabled"
      )
    end
    let!(:member) { create :cms_member, cur_site: site }

    it do
      visit "#{login_node.full_url}login.html" + "?" + { ref: URI.encode("https://www.ss-proj.org/") }.to_query

      within ".form-login" do
        fill_in "item[email]", with: member.email
        fill_in "item[password]", with: member.in_password

        click_on I18n.t("ss.login")
      end

      expect(page).to have_css(".body", text: "you've been logged in")
    end
  end
 end