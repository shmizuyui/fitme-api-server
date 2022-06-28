Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :user do
        resources :lessons, only: %i[index show]
        resources :trainers, only: %i[index show]
      end
    end
  end
end
