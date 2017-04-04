class Inquiry < ApplicationRecord
  enum closed: [:isopen, :isclosed, :isbooked]
  
  # belongs_to :user
  belongs_to :user
  belongs_to :wedding 
  validates :wedding, presence: true
  has_many :email_histories
  
  
  accepts_nested_attributes_for :wedding
   accepts_nested_attributes_for :email_histories
   after_update :on_update

  # curl -X PATCH http://localhost:3000/inquiries/154 -D '{ inquiry: { closed: true } }'
   # moved the inquiry close to the actual button
  # put in an after update to close the wedding
  after_update :on_update

  
  def on_update
    #byebug
    if self.isclosed?
      puts "closeing wedding related to this inquiry"
      wedding.closed!
    elsif self.isbooked?
       puts "booking wedding related to this inquiry"
      wedding.booked!
    end
  end

  def close_status
  #   # puts "*" * 88
  #   # puts self
    update_attributes(closed: :isclosed)
  #   # puts "*" * 88
  #   # puts self
  #   # puts "*" * 88
  end
  
end
