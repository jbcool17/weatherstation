def send_max_note(sensor, wd)
  if wd.temp >= sensor.trigger_temp_max
    puts "Note Max"
    # if Notification.last_notification_status(sensor)
      recipients = []
      notification = Notification.new message: "Temperature Alert: #{wd.temp}F @ #{wd.location}!",
                                      weather_datum_id: wd.id,
                                      sensor_id: sensor.id,
                                      contacts: []

      Email.all.each do |e|
        e.sensors.each do |id|
          if ( Sensor.find(id).location == wd.location )
            notification.contacts << e.email
          # SensorMailer.temp_email(e.email, l, data.temp, data.humidity).deliver_now
            recipients << e.email
          end
        end
      end
      notification.save!
    # end
  end
end

def send_min_note(sensor, wd)
  if wd.temp <= sensor.trigger_temp_min
    puts "Note Min"
    # if Notification.last_notification_status(sensor)
      recipients = []
      notification = Notification.new message: "Temperature Alert: #{wd.temp}F @ #{wd.location}!",
                                      weather_datum_id: wd.id,
                                      sensor_id: sensor.id,
                                      contacts: []

      Email.all.each do |e|
        e.sensors.each do |id|
          if ( Sensor.find(id).location == wd.location )
            notification.contacts << e.email
          # SensorMailer.temp_email(e.email, l, data.temp, data.humidity).deliver_now
            recipients << e.email
          end
        end
      end
      notification.save!
    # end
  end
end

WeatherDatum.destroy_all
Email.destroy_all
Notification.destroy_all
OutsideWeather.destroy_all
User.destroy_all
Sensor.destroy_all


User.create email: 'admin', password: 'test', password_confirmation: 'test', role: 'admin'
OutsideWeather.create name: 'New York', temp: 78.78, humidity: 34.0, pressure: 1007.0, description: 'few clouds'
Email.create email: 'test@test.com', sensors: Sensor.all.map { |s| s.id }

s1 = Sensor.create name: 'Sensor01', location: 'jam room'
s2 = Sensor.create name: 'Sensor02', location: 'living room'
s3 = Sensor.create name: 'Sensor03', location: 'bathroom'


20.times do |i|
    w1 = WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                        humidity: (rand(1..1000) * 0.1).round(2),
                        location: s1.location,
                        sensor_id: s1.id, created_at: Time.now + i

    w2 = WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                        humidity: (rand(1..1000) * 0.1).round(2),
                        location: s2.location,
                        sensor_id: s2.id, created_at: Time.now + i

    w3 = WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                        humidity: (rand(1..1000) * 0.1).round(2),
                        location: s3.location,
                        sensor_id: s3.id, created_at: Time.now + i

    send_max_note(s1, w1)
    send_min_note(s1, w1)
    send_max_note(s2, w2)
    send_min_note(s2, w2)
    send_max_note(s3, w3)
    send_min_note(s3, w3)
end

puts 'Done!'
