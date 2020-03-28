namespace :outside_weather do
  desc "Get Outside Weather Data"
  task current: :environment do
    url = URI("https://api.openweathermap.org/data/2.5/weather?zip=#{ENV['WEATHER_ZIP_CODE']}&appid=#{ENV['WEATHER_API_KEY']}&units=Imperial")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    hash = JSON.parse response.read_body

    OutsideWeather.create name: hash['name'], temp: hash['main']['temp'], humidity: hash['main']['humidity'],
                          pressure: hash['main']['pressure'], description: hash['weather'][0]['description']
  end

end

# curl 'https://api.openweathermap.org/data/2.5/weather?zip=10128&appid=<KEY>&units=Imperial'
