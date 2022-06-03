Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :reviews
    collection do
      get 'all'
    end
  end

end
