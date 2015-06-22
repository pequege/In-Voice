class Order < ActiveRecord::Base
  belongs_to :user
  has_many :details, dependent: :destroy
  belongs_to :client, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  validates :extra, presence: true

  TASK_TYPES = [ "BE - Backend development", "FE - Frontend development", "TD - Technical Direction", "PM - Project Management", "O - Other" ]

end
