class Inquiry < ApplicationRecord
  
  
  # belongs_to :user
  belongs_to :user
  belongs_to :wedding 
  validates :wedding, presence: true
  has_many :email_histories
  
  
  accepts_nested_attributes_for :wedding
   accepts_nested_attributes_for :email_histories
   after_update :on_update

  # curl -X PATCH http://localhost:3000/inquiries/154 -D '{ inquiry: { closed: true } }'
  def on_update
    if closed_changed? && closed?
      puts "Closing Wedding related to this inquiry"
      wedding.update!(status: :closed)
  end
  end

  def close_status
    # puts "*" * 88
    # puts self
    update_attributes(closed: true)
    # puts "*" * 88
    # puts self
    # puts "*" * 88
  end
  
end