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
		require "mysql2"
		mnosql = Mysql2::Client.new(:host => "66.147.244.127",  :username => "minnesu5_Allan",  :password => "L1nda46",  :database => "minnesu5_mnofficiants")
		res = mnosql.query("select created, 
			bridefirstname ,
				bridelastname ,
				groomfirstname, 
				groomlastname ,
				phone ,
				email ,
				location ,
				weddingdate ,
				weddingtime ,
				numberofguests ,
				comments ,
				state,
				officiantchoice1,
				officiantchoice2,
				officiantchoice3 from wp_pods_request where iswebupdated = 2;
				")
		# res = my.query("select count(*) from wp_pods_request;")
		# byebug
		res.each do |row|

		  @newwedding =  Wedding.new(:bride_first_name => row["bridefirstname"], :bride_last_name => row["bridelastname"],
		   	:groom_first_name => row["groomfirstname"], :groom_last_name => row["groomlastname"], 
		   	:web_date => row["weddingdate"],:web_time => row["weddingtime"], 
		   	:web_count => row["numberofguests"], :bride_email => row["email"], :bride_phone => row["phone"],
		   	:location => row["location"], :first_choice => row["officiantchoice1"], 
		   	:second_choice => row["officiantchoice2"], :third_choice => row["officiantchoice3"], :comments => row["comments"],
		   	:status => 0)
		   @newwedding.save
		end
		# now update the iswebupdated
		res = mnosql.query("update wp_pods_request set iswebupdated = 0 where iswebupdated = 2")
	end

  
end
