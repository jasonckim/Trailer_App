TrailerApp::Application.routes.draw do

resources :users do
   resources :favorites, :only => [:index, :create, :destroy]
end
resources :sessions
root to: 'sessions#new'

get 'signup', to: 'users#new', as: 'signup'

get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

get '/search', to: 'movies#show', as: 'search'
get '/home', to: 'movies#dashboard', as: 'home'
get '/movies/:imdbID', to: 'movies#results', as: 'movies'

end

      #   root GET    /                            movies#index
      # signup GET    /signup(.:format)            users#new
      #  login GET    /login(.:format)             sessions#new
      # logout GET    /logout(.:format)            sessions#destroy
      # search GET    /search(.:format)            movies#show
      #   home GET    /home(.:format)              movies#dashboard
      # movies GET    /movies/:imdbID(.:format)    movies#results
