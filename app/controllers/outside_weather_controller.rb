class OutsideWeatherController < ApplicationController
  def last
    render json: OutsideWeather.last
  end
end
