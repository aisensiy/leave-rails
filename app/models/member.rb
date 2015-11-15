class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum
  include ActiveModel::SecurePassword

  enum :role, [:manager, :employee, :admin, :system]

  field :name, type: String
  field :password_digest

  embeds_many :leave_requests
  embeds_many :timecards
  embeds_many :leave_conflicts

  validates_presence_of :name, :password, :role

  has_secure_password

  def assign_to manager
    Assignment.where(employee_id: self.id, current: true).update_all(current: false)
    Assignment.create(manager_id: manager.id, employee_id: self.id)
  end

  def assign
    manager_id = Assignment.where(employee_id: self.id, current: true).first.try(:manager_id)
    Member.find(manager_id) unless manager_id.nil?
  end
end
