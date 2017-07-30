

role :app, %w{weatherstation@172.16.11.49}
role :web, %w{weatherstation@172.16.11.49}
role :db,  %w{weatherstation@172.16.11.49}

server '172.16.11.49', user: 'weatherstation', roles: %w{web app}, my_property: :my_value

namespace :deploy do
  desc "Update crontab with whenever"
  task :update_cron do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
      end
    end
  end

  after :finishing, 'deploy:update_cron'
end
