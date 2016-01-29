class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to user
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user] = nil
    redirect_to '/'
  end

end