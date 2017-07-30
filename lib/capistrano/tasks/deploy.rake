namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
      on roles(:app) do
        execute 'rake db:seed'
      end
    end
end
