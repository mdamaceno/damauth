Damauth::Engine.routes.draw do
  namespace :admin do
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
  end
end
