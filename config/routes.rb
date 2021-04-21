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

end
