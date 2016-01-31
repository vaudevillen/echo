class PinsController < ApplicationController
  def index
    @pins = Pin.all
    if request.xhr?
        respond_to do |format|
          format.json { render json: @pins }
        end
    end
  end

  def new
    @pin = Pin.new
  end

  def create
    user = User.find(params[:id])
    @pin = Pin.new(song_id: params[:song_id], user: user.id, latitude: params[:lat], longitude: params[:lng], song_id: params[:song_id])
    redirect_to "pins/_form"
  end

  def show
    @friend_pins = Pin.where(user_id: params[:user_id])
    if request.xhr?
        respond_to do |format|
          format.json { render json: @friend_pins }
        end
    end
  end


  def edit
    @pin = Pin.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @pin = Pin.find(params[:id])
    if @pin.update_atributes(pin_params)
      redirect_to @pin
    else
      redirect_to edit_pin_path
  end


end
