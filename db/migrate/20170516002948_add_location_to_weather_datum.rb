class AddLocationToWeatherDatum < ActiveRecord::Migration[5.1]
  def change
    add_column :weather_data, :location, :text
  end
end
