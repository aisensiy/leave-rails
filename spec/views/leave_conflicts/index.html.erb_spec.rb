require 'rails_helper'

RSpec.describe "leave_conflicts/index", type: :view do
  before(:each) do
    assign(:leave_conflicts, [
      LeaveConflict.create!(),
      LeaveConflict.create!()
    ])
  end

  it "renders a list of leave_conflicts" do
    render
  end
end
