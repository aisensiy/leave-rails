class Timecard
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :member
  field :hour, type: Integer
  field :date, type: Time

  validates_presence_of :hour, :date
end
