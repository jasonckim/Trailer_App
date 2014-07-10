TrailerApp::Application.routes.draw do

resources :users do
  get 'search', on: :collection
end
# resources :favorites, :only => [:index, :create, :destroy]
resources :sessions
root to: 'movies#dashboard'

# get 'search', to: 'movies#search', as: 'moviesearch', on: collection 

get '/favorites', to: 'favorites#index', as: 'favorite'
post '/favorites/:id', to: 'favorites#create', as: 'favorites'
delete 'favorites/:id', to: 'favorites#destroy', as: 'destroy_favorite'

get 'signup', to: 'users#new', as: 'signup'

get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

get '/search', to: 'movies#show', as: 'search'
get '/home', to: 'movies#dashboard', as: 'home'
patch '/movies/:imdbID', to: 'movies#update' 
get '/movies/:imdbID', to: 'movies#results', as: 'movies'
end

#  Prefix Verb   URI Pattern                  Controller#Action
#            users GET    /users(.:format)             users#index
#                  POST   /users(.:format)             users#create
#         new_user GET    /users/new(.:format)         users#new
#        edit_user GET    /users/:id/edit(.:format)    users#edit
#             user GET    /users/:id(.:format)         users#show
#                  PATCH  /users/:id(.:format)         users#update
#                  PUT    /users/:id(.:format)         users#update
#                  DELETE /users/:id(.:format)         users#destroy
#         sessions GET    /sessions(.:format)          sessions#index
#                  POST   /sessions(.:format)          sessions#create
#      new_session GET    /sessions/new(.:format)      sessions#new
#     edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#          session GET    /sessions/:id(.:format)      sessions#show
#                  PATCH  /sessions/:id(.:format)      sessions#update
#                  PUT    /sessions/:id(.:format)      sessions#update
#                  DELETE /sessions/:id(.:format)      sessions#destroy
#             root GET    /                            sessions#new
#         favorite GET    /favorites(.:format)         favorites#index
#        favorites POST   /favorites/:id(.:format)     favorites#create
# destroy_favorite DELETE /favorites/:id(.:format)     favorites#destroy
#           signup GET    /signup(.:format)            users#new
#            login GET    /login(.:format)             sessions#new
#           logout GET    /logout(.:format)            sessions#destroy
#           search GET    /search(.:format)            movies#show
#             home GET    /home(.:format)              movies#dashboard
#                  PATCH  /movies/:imdbID(.:format)    movies#update
#           movies GET    /movies/:imdbID(.:format)    movies#results