class MoviesController < ApplicationController
# before_filter :signed_in_user, only: [:show, :results]

# def dashboard
#   @favorite_movies = current_user.favorites
# end

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

  # @movie = Movie.find_or_create_by(imdbID: @link, title: @title)
   
  response = Typhoeus.get("https://api.themoviedb.org/3/movie/#{@link}?api_key=#{ENV['MOVIE_KEY']}")
  trailerid = JSON.parse(response.body)
  @called = trailerid["id"]
  var = Typhoeus.get("https://api.themoviedb.org/3/movie/#{@called}/videos?api_key=#{ENV['MOVIE_KEY']}")
  var2 = JSON.parse(var.body)
  @var3 = var2["results"][0]["key"]
  # preparing @favorite for the form
  # @favorite = Favorite.find_by_movie_id(@movie) || Favorite.new

end

# def update
#   @movie = Movie.find_by_imdbID(params[:imdbID])
#   @favorite = Favorite.find_by_movie_id(@movie)
#   @favorite.update favorite_params
#   @favorite.save
#   redirect_to home_path
# end

# private
#   def favorite_params
#     params.require(:favorite).permit(:rating, :comment)
#   end

end
