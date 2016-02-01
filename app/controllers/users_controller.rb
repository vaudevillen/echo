class UsersController < ApplicationController
  FB_Base_uri = "https://blazing-inferno-5645.firebaseio.com/"
  FB_Firebase = Firebase::Client.new(FB_Base_uri)

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.state = State.find(@user.state).name
    if @user.save
      FB_Firebase.push("Users", @user.avatar)
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    profile_pic = FB_Firebase.get("Users", @user.avatar)
    puts "--------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    puts profile_pic.raw_body
    # @user.update_attribute(:avatar, profile_pic.raw_body)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      FB_Firebase.set("Users", @user.avatar)
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :city, :state, :email, :password, :avatar)
  end

end
