require "spec_helper"

describe WishlistlinesController do
  describe "routing" do

    it "routes to #index" do
      get("/wishlistlines").should route_to("wishlistlines#index")
    end

    it "routes to #new" do
      get("/wishlistlines/new").should route_to("wishlistlines#new")
    end

    it "routes to #show" do
      get("/wishlistlines/1").should route_to("wishlistlines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wishlistlines/1/edit").should route_to("wishlistlines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wishlistlines").should route_to("wishlistlines#create")
    end

    it "routes to #update" do
      put("/wishlistlines/1").should route_to("wishlistlines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wishlistlines/1").should route_to("wishlistlines#destroy", :id => "1")
    end

  end
end
