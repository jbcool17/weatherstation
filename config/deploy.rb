# config valid only for current version of Capistrano
lock "3.8.1"
set :app_version, 'v0.7b'
set :application, "WeatherStation"
set :repo_url, "git@bitbucket.org:duartsupport/weatherstation.git"

# Default branch is :master
# set :branch, 'feature-owjob'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/weatherstation"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
append :linked_files, "config/database.yml", "config/secrets.yml", ".env"

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads", "node-modules"
# append :nodenv_map_bins, 'bin/yarn'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rvm_ruby_version, '2.4.0'
set :passenger_environment_variables, { :path => '/usr/share/ruby/vendor_ruby/phusion_passenger/bin:$PATH' }
set :passenger_restart_command, '/usr/bin/passenger-config restart-app'

set :yarn_target_path, -> { release_path.join('node-modules') } #
set :yarn_flags, '--production --silent --no-progress'    # default
set :yarn_roles, :all                                     # default
set :yarn_env_variables, {}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'db:destroy_all_notifications'
      # end
    end
  end
end

namespace :webpacker do
  task :install do
    on roles(:web) do
      within release_path do
        execute "bin/yarn"
      end
    end
  end
end

namespace :deploy do
  after :finished, 'airbrake:deploy'
end

after 'bundler:install', 'webpacker:install'
