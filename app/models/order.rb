class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, :reject_if => :all_blank, allow_destroy: true
  validates :extra, :client, presence: true
  validates :order_number, uniqueness: true

  TASK_TYPES = [ "Backend development", "Frontend development", "Technical Direction", "Project Management", "Other" ]
  CURRENSY_TYPE = [ "ARS", "EUR", "USD" ]

  def subtotal
    subtotal = details.sum(:amount)
    return subtotal
  end

  def total
    total = charge.to_s.to_d + subtotal.to_s.to_d
    return total
  end

end
