Rails.application.routes.draw do
  #get 'relationships/followings'
  #get 'relationships/followers'

  resources :relationships, only: [:create, :destroy]

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  #resources :users do
    #resource :relationships, only: [:create, :destroy]
    #get 'followings' => 'relationships#followings', as: 'followings'
    # 'followers' => 'relationships#followers', as: 'followers'
  #end

  root 'homes#top'
  get 'home/about' => 'homes#about'
end
