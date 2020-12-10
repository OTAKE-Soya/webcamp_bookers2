Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:index, :edit, :show, :update]
  resources :books, only: [:index, :edit, :show, :destroy, :create, :update]
  # post 'users/:id' => 'users#create'
  get "home/about" => "homes#about"
end