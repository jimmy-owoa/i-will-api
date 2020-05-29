Rails.application.routes.draw do
  resources :tasks
  resources :lists
  resources :task_types
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :events
    end
  end
end
