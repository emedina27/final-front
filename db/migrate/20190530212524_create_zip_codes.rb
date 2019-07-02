class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.string :value
      t.references :city, null: false, foreign_key: true
     
      t.timestamps
    end
  end
end
