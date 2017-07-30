class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # Main Home Page
  def index
      @sensors = Sensor.all
      @chart_data =  @sensors.map { |s| { name: s.name, data: s.weather_datum.last(10).collect { |w| [w.created_at.strftime("%H:%M:%S"), w.temp] } }}
  end

  # Live Sensor View
  def live
    @host = "#{request.protocol}#{request.host_with_port}"
    @url = request.url
  end

  # /sensor/last
  # Outputs last reading from each sensor
  def last_sensor_reading
      render json: Sensor.all.map { |s| s.weather_datum.last }
  end

  def email_admin
    @emails = Email.all
  end

  def send_email
    data = WeatherDatum.all.to_a.sample
    recipients = []
    notification = Notification.new message: "Temperature Alert!: #{data.temp}F @ #{data.location}!",
                                    weather_datum_id: data.id
    notification.contacts = []

    Email.all.each do |e|
      e.sensors.each do |id|
        if ( Sensor.find(id).location == data.location )
          notification.contacts << e.email
        # SensorMailer.temp_email(e.email, l, data.temp, data.humidity).deliver_now
          recipients << e.email
        end
      end
    end

    notification.save!

    render json: { status: 'sent', contacts: recipients, location: data.location }
  end

  def current
    @host = "#{request.protocol}#{request.host_with_port}"
    @url = request.url
  end
end
