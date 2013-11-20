class AddLatToCountries < ActiveRecord::Migration
  def change
     add_column :countries, :lat, :decimal
     add_column :countries, :lon, :decimal
     add_column :countries, :photos_now, :text
  end
end
