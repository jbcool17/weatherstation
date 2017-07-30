# == Schema Information
#
# Table name: sensors
#
#  id                    :integer          not null, primary key
#  name                  :string
#  location              :string
#  api_key               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  trigger_temp_max      :integer          default("90")
#  trigger_temp_min      :integer          default("32")
#  notification_interval :integer          default("30")
#

class Sensor < ApplicationRecord
  has_many :weather_datum
  has_many :notifications

  # Validations
  # validates :name, :location, :api_key, presence: true
  # validates :name, uniqueness: true

  before_create do |sensor|
    sensor.api_key = sensor.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Sensor.exists?(api_key: token)
    end
  end

  # reset api key
end
