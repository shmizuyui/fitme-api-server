Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :user do
        mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/user/auth/registrations'
        }
        namespace :auth do
          resources :sessions, only: %i[index]
        end
        resources :lessons, only: %i[index show]
        resources :trainers, only: %i[index show]
        resources :reservations, only: %i[index create]
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
