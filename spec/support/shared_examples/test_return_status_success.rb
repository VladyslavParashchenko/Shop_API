# frozen_string_literal: true

RSpec.shared_examples "check is return status success" do
  it "status should be successful" do
    subject
    expect(response).to have_http_status(200)
  end
end
