class AddSensorNotifications < ActiveRecord::Migration[5.1]
  def change
    add_reference :notifications, :sensor, foreign_key: true
  end
end
