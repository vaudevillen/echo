class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more
    session[:spotify_user] = spotify_user.to_hash
    redirect_to new_playlist_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :city, :state, :email, :password)
  end

end
