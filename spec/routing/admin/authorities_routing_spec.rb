require "rails_helper"

RSpec.describe Admin::AuthoritiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/authorities").to route_to("admin/authorities#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/authorities/new").to route_to("admin/authorities#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/authorities/1").to route_to("admin/authorities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/authorities/1/edit").to route_to("admin/authorities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/authorities").to route_to("admin/authorities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/authorities/1").to route_to("admin/authorities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/authorities/1").to route_to("admin/authorities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/authorities/1").to route_to("admin/authorities#destroy", :id => "1")
    end

  end
end
