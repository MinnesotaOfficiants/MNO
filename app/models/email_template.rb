class EmailTemplate < ApplicationRecord
  has_many :email_histories
  def make_body
  	self.template_content
  end
end
