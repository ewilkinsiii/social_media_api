Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :user_ratings, except: [:destroy]
      resources :posts do
        resources :comments
      end
    end
  end
end
