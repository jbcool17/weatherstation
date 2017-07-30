module ApplicationHelper
  def set_sensor_names(sensors)
    sensors = sensors.map { |id| Sensor.find(id).location }.join(', ')
  end

  def set_email_list(email)
    email.join(', ')
  end
end
