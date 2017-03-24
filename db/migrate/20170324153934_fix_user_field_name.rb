class FixUserFieldName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :calendar_accouunt , :calendar_account
  end
end
