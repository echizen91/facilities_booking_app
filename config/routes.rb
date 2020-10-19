Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'rooms#index'
  get 'users' => 'users#index'
  get 'bookings' => 'bookings#index'
end
