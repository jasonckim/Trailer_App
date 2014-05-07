class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(display_name: params[:session][:display_name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      # session[:user_id] = user.id
      redirect_to home_path, notice: "Logged in!"
    else
      flash[:error] = "Name or password is invalid"
      render "new"
    end
  end

  def destroy
    sign_out
    #session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
