class CreateFavoritePlaces < ActiveRecord::Migration
  def change
    create_table :favorite_places do |t|

      t.timestamps
    end
  end
end
