require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    authenticate :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :user_ratings, except: [:destroy]
      resources :posts do
        resources :comments
      end
      get 'github/callback', to: 'events#github'
    end
  end

  root to: 'home#index'
end
