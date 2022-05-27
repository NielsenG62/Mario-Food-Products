Rails.application.routes.draw do
  root to: 'products#index'
  resources :products do
    resources :reviews
    collection do
      get 'all'
    end
  end

end
