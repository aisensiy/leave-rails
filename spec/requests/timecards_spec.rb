require 'rails_helper'

RSpec.describe "Timecards", type: :request do
  describe "GET /timecards" do
    it "works! (now write some real specs)" do
      get timecards_path
      expect(response).to have_http_status(200)
    end
  end
end
