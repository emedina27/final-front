class ChangeZipCityNull < ActiveRecord::Migration[5.2]
  def change
    change_column :zip_codes, :city_id, :integer, :null => true
  end
end
