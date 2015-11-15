require 'rails_helper'

RSpec.describe "timecards/new", type: :view do
  before(:each) do
    assign(:timecard, Timecard.new())
  end

  it "renders new timecard form" do
    render

    assert_select "form[action=?][method=?]", timecards_path, "post" do
    end
  end
end
