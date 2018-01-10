class EmailTemplate < ApplicationRecord
  has_many :email_histories
  belongs_to :user
  def make_body
  	self.template_content
  end

  
end
