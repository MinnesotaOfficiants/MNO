class FixTemplateName < ActiveRecord::Migration[5.0]
  def change
    rename_column :email_templates , :templaye_type, :template_type
  end
end
