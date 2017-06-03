Rails.application.routes.draw do
  devise_for :users
  resources :albums do
    resources :photos
  end
  root to: "albums#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
