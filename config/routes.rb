Rails.application.routes.draw do
  root :to => 'pages#home'
get '/users/edit' =>'users#edit'

  get '/users' => 'users#index'

  get '/users/profile' => 'users#profile'
  get '/admin' => 'pages#admin', :as => "admin"
  get '/map' => 'pages#map', :as => "map"
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

  end
  post '/posts/:post_id/likes' => 'likes#create', :as => "likes"
  delete '/posts/:post_id/likes' => 'likes#destroy'
  resources :relationships, :only => [:create, :destroy]
end
