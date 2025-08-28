 require "spec_helper"
 
 RSpec.describe "Enterprise Edition token domain",
               :skip_csrf, type: :rails_request do
   let(:current_user) { create(:admin) }
  let(:valid_token) { Rails.root.join("spec/fixtures/ee_tokens/v2_1_user_test_host.token").read }
  let(:invalid_token) { Rails.root.join("spec/fixtures/ee_tokens/v2_1_user_localhost_3001.token").read }
   let(:ee_token) { valid_token }
 
   before do