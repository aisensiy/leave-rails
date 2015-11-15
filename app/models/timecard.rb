class Timecard
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :member
  field :hour, type: Integer
  field :date, type: String

  validates_presence_of :hour, :date
end
