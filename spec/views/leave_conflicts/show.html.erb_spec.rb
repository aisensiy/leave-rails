require 'rails_helper'

RSpec.describe "leave_conflicts/show", type: :view do
  before(:each) do
    @leave_conflict = assign(:leave_conflict, LeaveConflict.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
