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
  validates :order_number, uniqueness: true

  accepts_nested_attributes_for :details, :reject_if => :all_blank, allow_destroy: true

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

  def custom_path
    "#{user.id}/#{client.name}/:filename"
  end

end
