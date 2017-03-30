class AddTemplateType < ActiveRecord::Migration[5.0]
  def change
    change_table :email_templates do |t|
      t.string :templaye_type
    end
  end
end
