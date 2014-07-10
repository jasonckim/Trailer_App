class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.create(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up!"
      sign_in @user 
      redirect_to home_path
    else
      flash[:error] = "Failed to create account.  Try again."
      render "new"
    end
  end

def update
  @user = User.findby(params[:id])
  @user.update_attributes(user_params)
  redirect_to root_url
end

 def search
    @search = SimpleSearch.new SimpleSearch.get_params(params)
    if @search.valid?
      @movies = @search.search_within User.all, :display_name
      @moviesearch = User.all
    end
  end

private
  def user_params
    params.require(:user).permit(:display_name, :email, :password, :password_confirmation)
  end
end

