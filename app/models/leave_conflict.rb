class LeaveConflict
  include Mongoid::Document
  include Mongoid::Timestamps
  field :leave_request_id, type: String
  field :timecard_id, type: String

  embedded_in :member

  validates_presence_of :leave_request_id, :timecard_id
end
