Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      namespace :user do
        resources :lessons, only: %i[index show]
        resources :trainers, only: %i[index show]
        namespace :lesson do
          resources :searches, only: %i[index]
        end
        namespace :trainer do
          resources :searches, only: %i[index]
        end
      end
    end
  end
end
