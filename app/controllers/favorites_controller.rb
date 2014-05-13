class FavoritesController < ApplicationController
  
  def index
    @favorites = current_user.favorites
  end

  def create
    @user = params[:id]
    @fav = Favorite.new
    @fav.movie_id = @user
    @fav.user_id = current_user.id
    @fav.save
    redirect_to home_path
  end

  # No authentication? or authorization?
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to home_path
  end
end

