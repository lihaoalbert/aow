require "spec_helper"

describe FieldGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/field_groups").should route_to("field_groups#index")
    end

    it "routes to #new" do
      get("/field_groups/new").should route_to("field_groups#new")
    end

    it "routes to #show" do
      get("/field_groups/1").should route_to("field_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/field_groups/1/edit").should route_to("field_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/field_groups").should route_to("field_groups#create")
    end

    it "routes to #update" do
      put("/field_groups/1").should route_to("field_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/field_groups/1").should route_to("field_groups#destroy", :id => "1")
    end

  end
end
