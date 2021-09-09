Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts
      resources :operation_names
      resources :operations
      get 'accounts/:id/operations_by_range' => 'accounts#operations_by_range'
    end
  end
end
