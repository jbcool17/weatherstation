# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WeatherDatum.destroy_all
Email.destroy_all
Notification.destroy_all
OutsideWeather.destroy_all
User.destroy_all
Sensor.destroy_all

s1 = Sensor.create name: 'Sensor01', location: 'jam room'
s2 = Sensor.create name: 'Sensor02', location: 'living room'
s3 = Sensor.create name: 'Sensor03', location: 'bathroom'

100.times do |i|
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

Email.create email: 'test@test.com', sensors: Sensor.all.map { |s| s.id }

r1 = WeatherDatum.first
r2 = WeatherDatum.all.to_a.sample

Notification.create message: "This is a test - #{r1.sensor.name}", contacts: ['test@test.com'], weather_datum_id: r1.id, sensor_id: r1.sensor.id
Notification.create message: "This is another test - #{r2.sensor.name}", contacts: ['test@test.com'], weather_datum_id: r2.id, sensor_id: r2.sensor.id

User.create email: 'admin', password: 'test', password_confirmation: 'test', role: 'admin'
OutsideWeather.create name: 'New York', temp: 78.78, humidity: 34.0, pressure: 1007.0, description: 'few clouds'

puts 'Done!'
