class SensorMailer < ApplicationMailer

  # default from: 'jbrilla17@gmail.com'

  def temp_email(email, sensor, temp, humidity)
    # create email list model
    # ??add to Notification Model - sensor / time / emails / reason
    @temp = temp
    @sensor = sensor
    @humidity = humidity
    mail(to: email, subject: "Temperature Alert! - #{temp} - #{sensor}")
  end
end
