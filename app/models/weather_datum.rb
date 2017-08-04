# == Schema Information
#
# Table name: weather_data
#
#  id         :integer          not null, primary key
#  temp       :float
#  humidity   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :text
#  sensor_id  :integer
#

class WeatherDatum < ApplicationRecord
  belongs_to :sensor, optional: true
  has_one :notification, :dependent => :delete

  before_create :set_location

  def set_sensor_id(api_key)
    self.sensor_id = Sensor.find_by(:api_key => api_key).id
  end

  def set_location
    self.location = self.sensor.location
  end

  def self.get_sensor_data(key)
    WeatherDatum.all.select { |d| d.sensor.api_key == key }
  end
end
