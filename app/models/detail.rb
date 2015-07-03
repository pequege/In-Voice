class Detail < ActiveRecord::Base
  belongs_to :order
  validates :project, :task, :hour, :rate, presence: true

  before_save :calculate_amount

  def calculate_amount
    self.amount = hour * rate
  end
end
