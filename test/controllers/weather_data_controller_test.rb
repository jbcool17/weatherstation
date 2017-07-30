require 'test_helper'

class WeatherDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_datum = weather_data(:one)
  end

  test "should get index" do
    get weather_data_url
    assert_response :success
  end

  test "should get new" do
    get new_weather_datum_url
    assert_response :success
  end

  test "should create weather_datum" do
    assert_difference('WeatherDatum.count') do
      post weather_data_url, params: { weather_datum: { humidity: @weather_datum.humidity, temp: @weather_datum.temp } }
    end

    assert_redirected_to weather_datum_url(WeatherDatum.last)
  end

  test "should show weather_datum" do
    get weather_datum_url(@weather_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_weather_datum_url(@weather_datum)
    assert_response :success
  end

  test "should update weather_datum" do
    patch weather_datum_url(@weather_datum), params: { weather_datum: { humidity: @weather_datum.humidity, temp: @weather_datum.temp } }
    assert_redirected_to weather_datum_url(@weather_datum)
  end

  test "should destroy weather_datum" do
    assert_difference('WeatherDatum.count', -1) do
      delete weather_datum_url(@weather_datum)
    end

    assert_redirected_to weather_data_url
  end
end
