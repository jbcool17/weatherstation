class AddWeatherDatumToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_reference :notifications, :weather_datum, foreign_key: true
  end
end
