Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    # The first entry is for devise. The second entry is for any other place we
    # navigate to /start, in case we change the user_root
    get 'start' => 'users#start', as: :user_root
    get 'start' => 'users#start', as: :start
  end

  root 'pages#home'

  resources :exercise_types
  resources :workout_types

  namespace :api do
    namespace :v1 do
      get '/workout_types' => 'workout_types#index'
      post '/workout_types' => 'workout_types#create'
    end
  end
end
