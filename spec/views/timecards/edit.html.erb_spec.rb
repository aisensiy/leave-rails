require 'rails_helper'

RSpec.describe "timecards/edit", type: :view do
  before(:each) do
    @timecard = assign(:timecard, Timecard.create!())
  end

  it "renders the edit timecard form" do
    render

    assert_select "form[action=?][method=?]", timecard_path(@timecard), "post" do
    end
  end
end
