class CreateEmailTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :email_templates do |t|
      t.integer :user_id
      t.text :template_content
      t.string :template_footer
      t.string :template_title
      
      t.timestamps
    end
  end
end
