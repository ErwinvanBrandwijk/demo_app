require "spec_helper"

describe WishlistsController do
  describe "routing" do

    it "routes to #index" do
      get("/wishlists").should route_to("wishlists#index")
    end

    it "routes to #new" do
      get("/wishlists/new").should route_to("wishlists#new")
    end

    it "routes to #show" do
      get("/wishlists/1").should route_to("wishlists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wishlists/1/edit").should route_to("wishlists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wishlists").should route_to("wishlists#create")
    end

    it "routes to #update" do
      put("/wishlists/1").should route_to("wishlists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wishlists/1").should route_to("wishlists#destroy", :id => "1")
    end

  end
end
