class Wedding < ApplicationRecord
  enum package_type: [:Budget, :Basic, :Standard]
  enum status: [ :open, :assigned, :booked, :closed]
  
  belongs_to :user
	has_many :inquiries 
	has_many :payments
	has_many :email_histories
	
	accepts_nested_attributes_for :payments
	accepts_nested_attributes_for :email_histories
	accepts_nested_attributes_for :inquiries
	def get_title
		@title = self.wedding_date.to_s + ' '+ self.bride_first_name + ' ' + self.bride_last_name + ' & ' + self.groom_first_name + ' ' + self.groom_last_name
	end
  
end
