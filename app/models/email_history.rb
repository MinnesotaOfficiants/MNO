class EmailHistory < ApplicationRecord
  belongs_to :history , polymorphic: true
  belongs_to :email_template
end
