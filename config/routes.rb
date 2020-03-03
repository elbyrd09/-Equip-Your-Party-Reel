Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: :dashboard

​
  resources :items do
    resources :pictures, only: [:create]
    resources :rentals, only: [:create]
  end
​
  resources :pictures, only: [:update, :destroy]
  resources :rentals, only: [:show, :destroy] do
    resources :reviews, only: [:create]
  end

end
