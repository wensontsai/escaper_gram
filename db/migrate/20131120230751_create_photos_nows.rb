class CreatePhotosNows < ActiveRecord::Migration
  def change
    create_table :photos_nows do |t|
      t.integer :country_id
      t.string :recent_photos

      t.timestamps
    end
  end
end
