require 'test_helper'

class OutsideWeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get outside" do
    get outside_weather_outside_url
    assert_response :success
  end

end
