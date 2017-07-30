Rails.application.routes.draw do

  #----------------------------
  # API ROUTES

  scope module: 'api' do
    namespace :v1 do
      # resources :weather_data
      get '/weather_data',  to: 'weather_data#index'
      post '/weather_data', to: 'weather_data#create'
    end
  end

  #----------------------------
  # View Routes
  root to: 'home#index'

  # Main Routes
  get '/sensor/last',     to: 'home#last_sensor_reading'
  get '/sensor/live',     to: 'home#live'
  get '/email/send',      to: 'home#send_email'
  get '/email/admin',     to: 'home#email_admin'
  get '/outside/last',    to: 'outside_weather#last'
  get '/weather/current', to: 'home#current'

  # User Routes
  # get 'sessions/new', to: 'sessions#create'
  # get 'signup', to: 'users#new', as: 'signup'

  get '/login',     to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy', as: 'logout'

  # Resources
  # resources :users
  resources :sensors, except: [:show]
  resources :emails, except: [:index, :show]
  resources :notifications, except: [:show, :new, :create, :edit]

  # Default - Non Routes goto home
  get '*path', to: 'home#index'
end
