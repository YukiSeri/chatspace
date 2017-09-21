Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages, only: [:index]
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
