namespace :db do
  desc "remove all notifications"
  task destroy_all_notifications: :production do
    Notification.destroy_all
    puts "Notifications Destroyed!"
  end

end
