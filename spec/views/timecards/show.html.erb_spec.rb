require 'rails_helper'

RSpec.describe "timecards/show", type: :view do
  before(:each) do
    @timecard = assign(:timecard, Timecard.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
