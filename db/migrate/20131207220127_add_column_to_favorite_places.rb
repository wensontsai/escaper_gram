class AddColumnToFavoritePlaces < ActiveRecord::Migration
  def change
    add_column :favorite_places, :user_id, :integer
    add_column :favorite_places, :lat, :decimal
    add_column :favorite_places, :lon, :decimal
    add_column :favorite_places, :address, :text
  end
end
