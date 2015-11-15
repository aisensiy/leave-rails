require 'rails_helper'

RSpec.describe "LeaveConflicts", type: :request do
  describe "GET /leave_conflicts" do
    it "works! (now write some real specs)" do
      get leave_conflicts_path
      expect(response).to have_http_status(200)
    end
  end
end
