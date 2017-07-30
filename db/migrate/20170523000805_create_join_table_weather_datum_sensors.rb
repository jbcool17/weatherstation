class CreateJoinTableWeatherDatumSensors < ActiveRecord::Migration[5.1]
  def change
    create_join_table :sensors, :weatherdata do |t|
      t.index [:sensor_id, :weatherdatum_id]
      t.index [:weatherdatum_id, :sensor_id]
    end
  end
end
