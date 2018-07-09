# frozen_string_literal: true

RSpec.shared_examples "check is object inserted in DB" do |model|
  describe "check insertion in the database" do
    it "should change count of users in DB" do
      expect { subject }.to change(model, :count).by 1
    end
  end
end
