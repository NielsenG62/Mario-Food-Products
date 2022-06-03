Rails.application.routes.draw do
  devise_for :users
  get '/index' => 'home#index'
  root to: 'home#index'
  resources :products do
    resources :reviews
    collection do
      get 'all'
    end
  end

end
