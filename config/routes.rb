Rails.application.routes.draw do
  root to: 'albums#index'
  resources :products do
    resources :reviews
  end
end
