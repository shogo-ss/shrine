class AddLatitudeLongitudeToShrines < ActiveRecord::Migration[5.2]
  def change
    add_column :shrines, :latitude, :float
    add_column :shrines, :longitude, :float
    #latitude = 緯度、longitude = 経度
  end
end
