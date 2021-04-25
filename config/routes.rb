Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  post 'topics/destroy/:id' => 'topics#destroy', as: :topic_destroy
  post 'posts/create' => 'posts#create', as: :post_create
  # resources :posts, only: [:create, :show]
  get 'chats/index'
  get 'chats/show'
  # get 'rooms/show'
  mount ActionCable.server => '/cable'
  # get 'chats/index'
  # get 'chats/show'
  get 'home/index'
  
  # resources :users, only: [:show]
  root to: "home#index"

  # get 'home#index' => '/'
  get 'about' => 'home#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    :sessions => 'users/sessions'   
  }





  devise_scope :user do
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
 
    get '/users/sign_out' => 'devise/sessions#destroy'

    # get "users/:id" => "users/registrations#detail"
    get "users/index" => "users#index", as: :list
    get "users/mypage" => "users#mypage"
    get "users/:id" => "users#show"
    get 'users/:id/edit' => "users#myedit"
    # post 'users/:id/update' => 'users#update'  
    patch 'users/:id/update' => 'users#update'  
    get "login", :to => "users/sessions#new"
    post 'login' => 'users/sessions#create'
    get "sign_out", :to => "users/sessions#destroy" 

    put 'users/:user_id/follow',to: 'users#follow'
    put 'users/:user_id/unfollow',to: 'users#unfollow'
    get 'users/follow_list/:user_id',to: 'users#follow_list'
    get 'users/follower_list/:user_id',to:'users#follower_list'

    get "rooms/:id" => "rooms#show"

    resources :users
    # resources :rooms
    resources :chats

    # resource :users, only: [:show,:edit,:update]
    # resource :messages, only: [:create]
    # resource :rooms, only: [:create,:show]
    

  end

end
