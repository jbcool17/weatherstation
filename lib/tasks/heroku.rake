namespace :heroku do
  desc "reset heroku weather data"
  task weather_data_reset: :environment do
    WeatherDatum.destroy_all

    s1 = Sensor.first
    s2 = Sensor.all[1]
    s3 = Sensor.all[2]

    20.times do |i|
        WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                            humidity: (rand(1..1000) * 0.1).round(2),
                            location: s1.location,
                            sensor_id: s1.id, created_at: Time.now + i

        WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                            humidity: (rand(1..1000) * 0.1).round(2),
                            location: s2.location,
                            sensor_id: s2.id, created_at: Time.now + i

        WeatherDatum.create temp: (rand(1..1000) * 0.1).round(2),
                            humidity: (rand(1..1000) * 0.1).round(2),
                            location: s3.location,
                            sensor_id: s3.id, created_at: Time.now + i
    end
  end

end
