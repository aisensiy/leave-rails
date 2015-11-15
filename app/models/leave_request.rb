class LeaveRequest
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :status, [:created, :approved, :rejected], default: :created
  field :title, type: String
  field :from, type: Time
  field :to, type: Time

  embedded_in :member

  validates_presence_of :title, :from, :to
end
