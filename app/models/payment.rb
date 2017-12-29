class Payment < ApplicationRecord
  belongs_to :wedding
  #attribute :pmt_amount, :decimal, default: 0
 # attribute :pmt_date, :date, default: Date.current
end
