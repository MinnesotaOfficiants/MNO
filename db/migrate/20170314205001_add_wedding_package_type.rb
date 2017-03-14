class AddWeddingPackageType < ActiveRecord::Migration[5.0]
  def change
    change_table :weddings do |t|
      t.integer "package_type"
    end
    
  end
end
