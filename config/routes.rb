Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :user do
        resources :lessons, only: :index
      end
      resources :health_checks, only: :index
    end
  end
end
