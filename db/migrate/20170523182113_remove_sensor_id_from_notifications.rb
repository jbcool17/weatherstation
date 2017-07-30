class RemoveSensorIdFromNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:notifications, :sensor, index: true, foreign_key: true)
  end
end
