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
	mount_uploader :image_file , PictureUploader 
	validate :image_size
	attribute :wedding_cost, :decimal, default: 0
	attribute :other_cost, :decimal, default: 0
	attribute :referal_fee, :decimal, default: 0
	attribute :fee_paid_amount, :decimal, default: 0


	def get_title
		  if   self.wedding_date  = nil 
			 @title = self.bride_first_name + ' ' + self.bride_last_name
		 else
		  	@title = self.wedding_date.strftime('%Y-%m-%d') + ' '+ self.bride_first_name + ' ' + self.bride_last_name
		  end 
		@title = @title + ' & ' + self.groom_first_name + ' ' + self.groom_last_name
	end
	def make_fee_payment
		# byebug
		self.update_columns(fee_paid: true, fee_paid_date: Date.today,fee_paid_amount: self.referal_fee)
		self.fee_paid =  true
		self.fee_paid_date =  Date.today 
		self.fee_paid_amount = self.referal_fee
		self.save

	end
	def  self.search(search)
		#byebug
		if search.present?
    	where("status = 2 and wedding_date = ? ", search).order(wedding_time: :desc)
    	
    else
			where("status = 0 and (wedding_date >= now() or wedding_date  IS NULL)").order(id: :desc)

    end
		
	end
	def get_header
		self.bride_last_name + '-'+self.groom_last_name
	end
	
  def email_salutation

    # prts needed for the email 1 hopefuly we gat a param with the template id
    "Dear " << self.bride_first_name + '  and ' + self.groom_first_name 

  end
  def calculate_cost(current_user)
  		#byebug
		if self.wedding_cost.blank?
			self.wedding_cost = 0
		end
		if self.other_cost.blank?
			self.other_cost = 0
		end
  	if  self.wedding_cost == 0 
  		case self.package_type
	    	when  "Budget" 
	       self.wedding_cost = 175
	      when "Basic"
	       	self.wedding_cost = 295
	      when "Standard"
	       	self.wedding_cost = 395
	      else
	       	self.wedding_cost = 395
     	end
     end
     if self.rehearsal? 
     		self.wedding_cost = self.wedding_cost + 100
     end
     self.referal_fee = self.wedding_cost * current_user.user_fee_pct
     self.save

  end

  def book(current_user)
  	 # byebug
  	 self.status = :booked
     self.user_id = current_user.id
     self.calculate_cost(current_user)
       self.save
  end
	
	def get_new_weddings
		require "rest-client"
		require "mysql2"
		#mnosql = Mysql2::Client.new(:host => "66.147.244.127",  :username => "minnesu5_Allan",  :password => "L1nda46",  :database => "minnesu5_mnofficiants")
		
		mnosql = Mysql2::Client.new(:host => "66.147.244.127",  :username => "minnesu5_FMP",  :password => "MN!#Wed13",  :database => "minnesu5_mnofficiants")
		
	

		
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
			#akl 10/17/17  add this for counseling   if(locate('Pre',preparations)>0,1,0) as counseling
		res.each do |row|

		  @newwedding =  Wedding.new(:bride_first_name => row["bridefirstname"], 
		  	:bride_last_name => row["bridelastname"],
		   	:groom_first_name => row["groomfirstname"], :groom_last_name => row["groomlastname"], 
		   	:web_date => row["weddingdate"],:web_time => row["weddingtime"], 
		   	:web_count => row["numberofguests"], :bride_email => row["email"], :bride_phone => row["phone"],
		   	:location => row["location"], :first_choice => row["officiantchoice1"], 
		   	:guest_count => row["numberofguests"],:second_choice => row["officiantchoice2"], 
		   	:third_choice => row["officiantchoice3"], :comments => row["comments"],
		   	:status => 0)
		   @newwedding.save
		  
		end
		# now update the iswebupdated
		#res = mnosql.query("update wp_pods_request set iswebupdated = 0 where iswebupdated = 2")
	end
	private 
		
		def image_size 
			if image_file.size > 5.megabytes
				errors.add(:image_file, "Should be less than 5 MB")
			end
		end

  
end
