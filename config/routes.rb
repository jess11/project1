Rails.application.routes.draw do
  root :to => 'pages#home'
get '/users/edit' =>'users#edit'

  get '/users' => 'users#index'

  get '/users/profile' => 'users#profile'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :users, :only => [:new, :create, :update, :show] do
    member do
          get :following, :followers
        end
  end
  resources :posts, :only => [:create, :destroy] do
    resources :comments
    put '/likes' => 'likes#update', as: 'likes'
  end
  resources :relationships, :only => [:create, :destroy]
end
