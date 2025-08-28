     it_behaves_like example_name, status: status
   end
 end

RSpec.shared_examples 'rejects invalid package names' do
  let(:package_name) { "%0d%0ahttp:/%2fexample.com" }

  it do
    subject

    expect(response).to have_gitlab_http_status(:bad_request)
    expect(Gitlab::Json.parse(response.body)).to eq({ 'error' => 'package_name should be a valid file path' })
  end
end