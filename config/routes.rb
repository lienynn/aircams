Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cameras do
    resources :rentals, only: [ :new, :create ]
  end

  get 'my_cameras', to: 'cameras#my_cameras'
  get 'my_owner_rentals', to: 'rentals#my_owner_rentals'
  get 'my_camera_rentals/:id', to: 'rentals#my_camera_rentals', as: :my_camera_rentals

  resources :rentals, only: [ :index, :show, :destroy ] do
    get 'acepted!', to: 'rentals#accepted!', as: :accepted
    get 'declined!', to: 'rentals#declined!', as: :declined
  end
end
