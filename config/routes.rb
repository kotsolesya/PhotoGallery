Rails.application.routes.draw do
  get 'about/index'

  devise_for :users
  resources :albums do
    resources :photos
  end
  root to: 'albums#index'
end
