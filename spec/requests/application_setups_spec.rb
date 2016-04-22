require 'rails_helper'

RSpec.describe "ApplicationSetups", type: :request do
  describe "GET /application_setups" do
    it "works! (now write some real specs)" do
      get application_setups_path
      expect(response).to have_http_status(200)
    end
  end
end
