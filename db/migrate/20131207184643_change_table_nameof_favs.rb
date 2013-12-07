class ChangeTableNameofFavs < ActiveRecord::Migration
  def change
    rename_table :favorites, :favorite_photos
  end
end
