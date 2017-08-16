class AddPictureFieldWedding < ActiveRecord::Migration[5.0]
  def change
    change_table :weddings do |t|
      t.string  "image_file"
  end
end
end