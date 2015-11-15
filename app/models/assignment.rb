class Assignment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :current, type: Boolean, default: true
  field :employee_id, type: String
  field :manager_id, type: String
end
