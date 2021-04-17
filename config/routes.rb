Rails.application.routes.draw do
  get 'opinions/index'
  get 'opinions/show'
  get 'opinions/new'
  get 'opinions/create'
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  root 'users#index'
  devise_for :users
  resources :users




  resources :opinions do
      resources :likes
  end
  resources :comments do
    resources :likes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  
post 'opinions/index', to: 'comments#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
