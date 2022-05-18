Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cameras do
    resources :rentals, only: [ :new, :create ]
  end

  get 'my_cameras', to: 'cameras#my_cameras'

  resources :rentals, only: [ :index, :show, :destroy ]
end
