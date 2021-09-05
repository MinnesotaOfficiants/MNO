class User < ApplicationRecord
  
    attr_accessor   :password, :password_confirmation
  
  # attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  
  has_many :weddings
	has_many :inquiries
  has_many :email_templates
	
  # has_secure_password

  def get_user_name
    self.first_name+ " " + self.last_name 
  end
	def get_signature
		# full name on line 1
		# phone on line 2
		# email on line 3
	   self.first_name+ " " + self.last_name  + "\n" + self.user_phone + "\n" + self.email
# 	update_attributes(salutation: @string)
	end
	
  def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  def update
    self.encrypt_password()
    self.save
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
