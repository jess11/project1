Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :update]
  get '/users' => 'users#index'
  get '/users/edit' =>'users#edit'
  get '/users/profile' => 'users#profile'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts, :only => [:create, :destroy]


end
