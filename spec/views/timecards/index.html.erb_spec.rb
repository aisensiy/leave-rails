require 'rails_helper'

RSpec.describe "timecards/index", type: :view do
  before(:each) do
    assign(:timecards, [
      Timecard.create!(),
      Timecard.create!()
    ])
  end

  it "renders a list of timecards" do
    render
  end
end
