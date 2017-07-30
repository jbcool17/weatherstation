# == Schema Information
#
# Table name: notifications
#
#  id               :integer          not null, primary key
#  message          :text
#  contacts         :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  weather_datum_id :integer
#  sensor_id        :integer
#

class Notification < ApplicationRecord
  belongs_to :weather_datum, optional: true
  belongs_to :sensor, optional: true

  serialize :contacts, Array

  # Validations
  # validates :message, presence: true
  # validates :contacts, presence: true

  def self.last_notification_status(sensor)

    if !sensor.notifications.empty?
      last_notification = Notification.where(sensor_id: sensor.id).sort_by(&:created_at).last.created_at
    else
      last_notification = 100.years.ago
    end

    last_notification <= sensor.notification_interval.minutes.ago
  end

end
