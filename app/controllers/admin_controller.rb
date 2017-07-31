class AdminController < ApplicationController
  def index
    @emails = Email.all
    @notifications = Notification.all
    @sensors = Sensor.all
  end
end
