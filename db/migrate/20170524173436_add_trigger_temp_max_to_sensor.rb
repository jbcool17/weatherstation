class AddTriggerTempMaxToSensor < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :trigger_temp_max, :integer, default: 90
  end
end
