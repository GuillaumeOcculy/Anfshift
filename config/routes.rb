Rails.application.routes.draw do

  root 'shifts#index'

  resources :users do
    resources :shifts, only: [:index, :show]
  end

  resources :shifts do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup' => 'users#new', as: :signup
  get 'signin' => 'sessions#new', as: :signin
  get 'signout' => 'sessions#destroy', as: :signout

end
