require 'rails_helper'

RSpec.describe "leave_conflicts/new", type: :view do
  before(:each) do
    assign(:leave_conflict, LeaveConflict.new())
  end

  it "renders new leave_conflict form" do
    render

    assert_select "form[action=?][method=?]", leave_conflicts_path, "post" do
    end
  end
end
