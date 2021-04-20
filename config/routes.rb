Rails.application.routes.draw do
  root 'opinions#index'
  get '/follow_user/:id' , to: 'users#follow_user', as: :follow_user
  devise_for :users
  resources :users do
    resources :followings
  end



  resources :opinions do
    resources :comments
    resources :likes
  end


#post 'opinions/index', to: 'comments#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end