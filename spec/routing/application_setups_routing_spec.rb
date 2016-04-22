require "rails_helper"

RSpec.describe ApplicationSetupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/application_setups").to route_to("application_setups#index")
    end

    it "routes to #new" do
      expect(:get => "/application_setups/new").to route_to("application_setups#new")
    end

    it "routes to #show" do
      expect(:get => "/application_setups/1").to route_to("application_setups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/application_setups/1/edit").to route_to("application_setups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/application_setups").to route_to("application_setups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/application_setups/1").to route_to("application_setups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/application_setups/1").to route_to("application_setups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/application_setups/1").to route_to("application_setups#destroy", :id => "1")
    end

  end
end
