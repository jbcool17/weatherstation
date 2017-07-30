class AddNotificationIntervalToSensor < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :notification_interval, :integer, default: 30
  end
end
