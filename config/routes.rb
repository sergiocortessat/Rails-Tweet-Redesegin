Rails.application.routes.draw do
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
