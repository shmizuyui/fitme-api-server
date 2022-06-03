Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :user do
        resources :lessons, only: [:index, :show]
      end
    end
  end
end