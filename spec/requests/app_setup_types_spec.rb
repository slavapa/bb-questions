require 'rails_helper'

RSpec.describe "AppSetupTypes", type: :request do
  describe "GET /app_setup_types" do
    it "works! (now write some real specs)" do
      get app_setup_types_path
      expect(response).to have_http_status(200)
    end
  end
end
