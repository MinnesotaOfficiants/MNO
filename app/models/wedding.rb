class Wedding < ApplicationRecord
  enum package_type: [:Budget, :Basic, :Standard]
  enum status: [ :open, :assigned, :booked, :closed]
  
  # belongs_to :user
	has_many :inquiries 
	has_many :payments
	has_many :email_histories, as: :history
	
	accepts_nested_attributes_for :payments
	accepts_nested_attributes_for :email_histories
	accepts_nested_attributes_for :inquiries
	def get_title
		@title = self.wedding_date.to_s + ' '+ self.bride_first_name + ' ' + self.bride_last_name + ' & ' + self.groom_first_name + ' ' + self.groom_last_name
	end
	def get_header
		self.bride_last_name + '-'+self.groom_last_name
	end
	def get_new_weddings
		require "mysql"
		my = Mysql::new("host", "user", "passwd", "db")
		res = my.query("select * from tbl")
		res.each do |row|
		  col1 = row[0]
		  col2 = row[1]
		end
	end

  
end
