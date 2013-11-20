class RemovePhotosNowFromCountry < ActiveRecord::Migration
  def change
    remove_column :countries, :photos_now, :text
  end
end
