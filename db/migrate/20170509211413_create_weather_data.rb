class CreateWeatherData < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_data do |t|
      t.float :temp
      t.float :humidity

      t.timestamps
    end
  end
end
