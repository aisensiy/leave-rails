require "rails_helper"

RSpec.describe LeaveConflictsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leave_conflicts").to route_to("leave_conflicts#index")
    end

    it "routes to #new" do
      expect(:get => "/leave_conflicts/new").to route_to("leave_conflicts#new")
    end

    it "routes to #show" do
      expect(:get => "/leave_conflicts/1").to route_to("leave_conflicts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leave_conflicts/1/edit").to route_to("leave_conflicts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leave_conflicts").to route_to("leave_conflicts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/leave_conflicts/1").to route_to("leave_conflicts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/leave_conflicts/1").to route_to("leave_conflicts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leave_conflicts/1").to route_to("leave_conflicts#destroy", :id => "1")
    end

  end
end
