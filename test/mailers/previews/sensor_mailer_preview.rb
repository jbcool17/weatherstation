# Preview all emails at http://localhost:3000/rails/mailers/sensor_mailer
class SensorMailerPreview < ActionMailer::Preview
  def temp_email
    SensorMailer.temp_email('Sensor 1', '400', '40')
  end
end
