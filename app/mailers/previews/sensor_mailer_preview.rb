
class UserMailerPreview < ActionMailer::Preview
  def temp_email
    SensorMailer.temp_email('Sensor 1', '400')
  end
end
