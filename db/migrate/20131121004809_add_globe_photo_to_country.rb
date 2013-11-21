class AddGlobePhotoToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :globe_photo, :text
  end
end
