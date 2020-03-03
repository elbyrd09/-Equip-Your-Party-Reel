Rails.application.routes.draw do
  get 'reviews/create'
  get 'pictures/create'
  get 'pictures/udpate'
  get 'pictures/destroy'
  get 'rentals/show'
  get 'rentals/create'
  get 'rentals/destroy'
  get 'items/index'
  get 'items/show'
  get 'items/create'
  get 'items/new'
  get 'items/update'
  get 'items/edit'
  get 'items/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
