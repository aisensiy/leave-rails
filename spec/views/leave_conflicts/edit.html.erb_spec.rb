require 'rails_helper'

RSpec.describe "leave_conflicts/edit", type: :view do
  before(:each) do
    @leave_conflict = assign(:leave_conflict, LeaveConflict.create!())
  end

  it "renders the edit leave_conflict form" do
    render

    assert_select "form[action=?][method=?]", leave_conflict_path(@leave_conflict), "post" do
    end
  end
end
