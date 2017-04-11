class Inquiry < ApplicationRecord
  enum closed: [:isopen, :isclosed]
  
  # belongs_to :user
  belongs_to :user
  belongs_to :wedding 
  validates :wedding, presence: true
  has_many :email_histories, as: :history
  
  
  accepts_nested_attributes_for :wedding
  accepts_nested_attributes_for :email_histories
  after_update :on_update

  # curl -X PATCH http://localhost:3000/inquiries/154 -D '{ inquiry: { closed: true } }'
   # moved the inquiry close to the actual button
  # put in an after update to close the wedding
  after_update :on_update

  
  def on_update
    if self.isclosed?
      puts "closeing wedding related to this inquiry"
      wedding.closed!
    #elsif self.isopen?
      # puts "booking wedding related to this inquiry"
      #wedding.booked!
    #elsif self.isopen?
     # puts "not done"
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
  def test_method
    User.find(75).get_salutation 
  end
  def email_salutation

    # prts needed for the email 1 hopefuly we gat a param with the template id
    "Dear " << self.wedding.bride_first_name + '  and ' + self.wedding.groom_first_name 

  end

  
end
