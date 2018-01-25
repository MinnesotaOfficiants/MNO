class ChangeFeeDecimals < ActiveRecord::Migration[5.0]
  def change
  	execute "alter table weddings alter column referal_fee type decimal(10,2)"

  	execute "alter table weddings alter column fee_paid_amount type decimal(10,2)"

  end
end
