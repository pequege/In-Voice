class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  has_many :details, dependent: :destroy

  has_attached_file :invoice_file,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :path => :custom_path
  
  validates_attachment_content_type :invoice_file, :content_type => ["application/pdf"]
  
  validates :extra, :client, presence: true
  validates :order_number, presence: true, uniqueness: true

  accepts_nested_attributes_for :details, :reject_if => :all_blank, allow_destroy: true

  TASK_TYPES = [ "Backend development", "Frontend development", "Technical Direction", "Project Management", "Other" ]
  CURRENSY_TYPE = [ "ARS", "EUR", "USD" ]

  def subtotal
    details.sum(:amount)
  end

  def total
    charge + subtotal
  end

  def value
    user.min_index + user.orders.count
  end 

  def custom_path
    "#{client.name}/:filename"
  end

end
