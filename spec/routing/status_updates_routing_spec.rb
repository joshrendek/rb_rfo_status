require "spec_helper"

describe StatusUpdatesController do
  describe "routing" do

    it "routes to #index" do
      get("/status_updates").should route_to("status_updates#index")
    end

    it "routes to #new" do
      get("/status_updates/new").should route_to("status_updates#new")
    end

    it "routes to #show" do
      get("/status_updates/1").should route_to("status_updates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/status_updates/1/edit").should route_to("status_updates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/status_updates").should route_to("status_updates#create")
    end

    it "routes to #update" do
      put("/status_updates/1").should route_to("status_updates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/status_updates/1").should route_to("status_updates#destroy", :id => "1")
    end

  end
end
