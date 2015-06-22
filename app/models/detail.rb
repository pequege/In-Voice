class Detail < ActiveRecord::Base
  belongs_to :order
  validates :project, presence: true
end
