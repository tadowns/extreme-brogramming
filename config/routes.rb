Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    get 'dashboard' => 'users#dashboard', as: :user_root
    get 'dashboard' => 'users#dashboard', as: :dashboard
  end

  root 'pages#home'
end