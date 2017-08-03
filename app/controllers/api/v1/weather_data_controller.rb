module Api::V1
  class WeatherDataController < ApiController
    before_action :set_weather_datum, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_api, only: [:create]

    # Skipping CSRF Token from form to allow curl based POST - Remove forms
    skip_before_action :verify_authenticity_token, only: [:create]

    # GET /weather_data
    # GET /weather_data.json
    def index
      render json: WeatherDatum.all
    end

    # POST /weather_data
    # POST /weather_data.json
    def create
      weather_datum = WeatherDatum.new(weather_datum_params)
      weather_datum.set_sensor_id(request.headers['Authorization'].match(/(Token token=)(.*)/)[2])
      sent = false

        if weather_datum.save

          if weather_datum.temp > weather_datum.sensor.trigger_temp_max

            if Notification.last_notification_status(weather_datum.sensor)
              recipients = []
              notification = Notification.new message: "Temperature Alert: #{weather_datum.temp}F @ #{weather_datum.location}!",
                                              weather_datum_id: weather_datum.id,
                                              sensor_id: weather_datum.sensor.id,
                                              contacts: []

              Email.all.each do |e|
                e.sensors.each do |id|
                  if ( Sensor.find(id).location == weather_datum.location )
                    notification.contacts << e.email
                  # SensorMailer.temp_email(e.email, l, data.temp, data.humidity).deliver_now
                    recipients << e.email
                  end
                end
              end
              sent = true
              notification.save!

            end
          end

          render json: {status: "Record was created!", notification: sent}
        else
          render json: {status: "Record wasn't created!", errors: weather_datum.errors}
        end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_weather_datum
        render json: WeatherDatum.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def weather_datum_params
        params.require(:weather_datum).permit(:temp, :humidity, :location)
      end
    end
end
