class Payment < ApplicationRecord
  belongs_to :wedding, inverse_of: :payments
  attribute :pmt_amount, :decimal, default: 0
 	attribute :pmt_date, :date, default: Date.current
end
