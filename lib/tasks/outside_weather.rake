namespace :outside_weather do
  desc "TODO"
  task current: :environment do
    url = URI("http://api.openweathermap.org/data/2.5/weather?zip=10019%2Cus&appid=#{ENV['WEATHER_API_KEY']}&units=Imperial")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    hash = JSON.parse response.read_body

    OutsideWeather.create name: hash['name'], temp: hash['main']['temp'], humidity: hash['main']['humidity'],
                          pressure: hash['main']['pressure'], description: hash['weather'][0]['description']
  end

end
