Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :lists
      resources :tasks
      resources :task_types, only: [:index]
      resources :measure_units, only: [:index]
      get 'get_lists', to: 'lists#get_lists'
    end
  end
end
