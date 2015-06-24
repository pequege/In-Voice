class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :client, dependent: :destroy
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  validates :extra, presence: true

  TASK_TYPES = [ "Backend development", "Frontend development", "Technical Direction", "Project Management", "Other" ]

  def subtotal
    subtotal = details.sum(:amount)
    return subtotal
  end

end
