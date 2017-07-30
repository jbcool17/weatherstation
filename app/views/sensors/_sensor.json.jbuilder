json.extract! sensor, :id, :name, :location, :api_key, :trigger_temp_max, :trigger_temp_min, :notification_interval, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
