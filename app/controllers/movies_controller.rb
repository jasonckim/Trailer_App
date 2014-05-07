class MoviesController < ApplicationController
before_filter :signed_in_user, only: [:show, :results]

def dashboard
  @movies = Movie.find_by_user_id(current_user.id)
  # on dashboard method, 
      # recall imdbID and title from database where user_id = current_user.id
      # @movies = Movie.find_by_user_id(current_user.id)
  # on dashboard page, build the link using title as the text and the imdbID
  # to build the link.
end

def show
  search_str = params[:movie]
  response = Typhoeus.get("http://www.omdbapi.com/", :params => {:s => search_str})
  omdbdata = JSON.parse(response.body)
  @movies = omdbdata["Search"]
end

def results
  imdb_id = params[:imdbID]
  info = Typhoeus.get("http://www.omdbapi.com/", :params => {:i => imdb_id})
  @infodata = JSON.parse(info.body)
  @link = @infodata["imdbID"]
  @title = @infodata["Title"]

  @movie = Movie.find_or_create_by(imdbID: @link, title: @title)
  # Movie.create(imdbID: imbdID, title: @title, user_id: current_user.id)
  #end 
  # create a new table with user_id, imdb_id and title fields
  # need to save imdb_id and @title in database with current_user.id
   
  response = Typhoeus.get("https://api.themoviedb.org/3/movie/#{@link}?api_key=#{ENV['MOVIE_KEY']}")
  trailerid = JSON.parse(response.body)
  @called = trailerid["id"]
  var = Typhoeus.get("https://api.themoviedb.org/3/movie/#{@called}/videos?api_key=#{ENV['MOVIE_KEY']}")
  var2 = JSON.parse(var.body)
  @var3 = var2["results"][0]["key"]
end

# def fav
#     @id = params[:id] #store the track id
#     @favs = Favorite.new
#     @favs.imdb_id = @id
#     @favs.user_id = http://current_user.id 
#     @favs.save
#     redirect_to profile_path
#   end

end
