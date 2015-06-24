class Client < ActiveRecord::Base
  belongs_to :users
  has_many :orders
  validates :name, presence: true
end
