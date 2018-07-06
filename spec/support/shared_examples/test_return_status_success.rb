# frozen_string_literal: true

RSpec.shared_examples "check is return status success" do
  it "status should be successful" do
    subject
    expect(response.status).to eq(200)
  end
end
