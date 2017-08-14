namespace :auto_sensor do
  desc "Generate Live Sensor Data"
  task start: :environment do
    puts "Starting"
    # get sensors
    while true do
      Sensor.all.each do |sensor|
        temp = rand(100)
        puts ""
        puts "Posting data from sensor: #{sensor.name}: #{temp} degrees"
        cmd = "curl -X POST -H \"Content-Type: application/json\" -H \"Cache-Control: no-cache\" -H \"Authorization: Token token=#{sensor.api_key}\" -d '{\"weather_datum\": {\"temp\": #{temp}, \"humidity\": #{rand(100)} }}' \"http://localhost:3000/v1/weather_data\""
        system(cmd)
        sleep 2
      end
      puts ""
      puts "Waiting..."
      sleep 10
    end
  end
end
