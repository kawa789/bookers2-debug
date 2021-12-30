Rails.application.routes.draw do
  #get 'relationships/followings'
  #get 'relationships/followers'


  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
     #get 'users/:id/followings' => 'relationships#followings', as: 'followings'
     #get 'users/:id/followers' => 'relationships#followers', as: 'followers'
    get :followings, on: :member
    get :followers, on: :member
  resource :relationships, only: [:create, :destroy]
  end
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
