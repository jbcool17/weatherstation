class AddReferencesToWeatherDatum < ActiveRecord::Migration[5.1]
  def change
    add_reference :weather_data, :sensor, foreign_key: true
  end
end
