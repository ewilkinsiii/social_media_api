require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, path: '/admin', path_names: { sign_in: 'login', sign_out: 'logout' }, skip: [:registrations]
  namespace :admin do
    authenticate :admin_user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  get '/auth/github/callback', to: 'auth#github'

  namespace :api do
    namespace :v1 do
      resources :user_ratings, except: [:destroy]
      resources :posts do
        resources :comments
      end
    end
  end

  root to: 'home#index'
end
