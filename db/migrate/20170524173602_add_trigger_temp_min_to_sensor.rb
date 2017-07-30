class AddTriggerTempMinToSensor < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :trigger_temp_min, :integer, default: 32
  end
end
