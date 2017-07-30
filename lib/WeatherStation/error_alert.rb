# require 'filewatcher'
# require 'mail'
# require 'pry'
#
# def send_alert(message)
#   Mail.deliver do
#     from     'test@test.com'
#     to       ENV['EMAIL']
#     subject  "WeatherStation Error!"
#     body     "#{message}"
#   end
# end
#
# FileWatcher.new('/var/www/weatherstation/shared/log/production.log', spinner: true, interval: 0.1).watch do |f,e|
#  puts "#{Time.now} - #{f} - #{e}"
#
#
#  l = File.readlines(f).last.match(/^F/)
#  if !l.nil?
#    if l[1] == 'F'
#      send_alert(File.readlines(f).last(10))
#      put "====> Alert Sent!"
#      #puts "OUT: #{File.readlines(f).last(3)}"
#    end
#  end
# end
