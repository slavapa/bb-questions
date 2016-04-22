require "rails_helper"

RSpec.describe AppSetupTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/app_setup_types").to route_to("app_setup_types#index")
    end

    it "routes to #new" do
      expect(:get => "/app_setup_types/new").to route_to("app_setup_types#new")
    end

    it "routes to #show" do
      expect(:get => "/app_setup_types/1").to route_to("app_setup_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/app_setup_types/1/edit").to route_to("app_setup_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/app_setup_types").to route_to("app_setup_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/app_setup_types/1").to route_to("app_setup_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/app_setup_types/1").to route_to("app_setup_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/app_setup_types/1").to route_to("app_setup_types#destroy", :id => "1")
    end

  end
end
