class PinsController < ApplicationController
  include ApplicationHelper
  before_filter :authorize
  def index
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts current_user.avatar.url(:thumb)
    @pins = Pin.where(user_id: current_user.id)
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
    user = current_user
    @pin = Pin.new(username: user.fullname, song_artist: params[:song_artist], song_title: params[:song_title], song_id: params[:song_id], user_id: user.id, latitude: params[:lat], longitude: params[:lng], comment: params[:comment], address: params[:address])
    @pin.save
    redirect_to :back
  end

  def show
    @friend_pins = Pin.where(user_id: params[:id])
    if request.xhr?
        respond_to do |format|
          format.json { render json: @friend_pins }
        end
    end
  end

#the following is incomplete. It's to return nested arrays to show multiple users pins
  def show_multiple
    @friends_arrays = []
    @friends_arrays << Pin.where(user_id: params[:id])
    friend_ids = params[:friend_ids].split('+')
    friend_ids.each do |id|
      @friends_arrays << Pin.where(user_id: params[:id])
    end
    if request.xhr?
        respond_to do |format|
          format.json { render json: @friend_arrays }
        end
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end


  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      redirect_to user_path(@pin.user_id)
    else
      redirect_to edit_pin_path
    end
  end

  def pin_params
    params.require(:pin).permit(:comment)
  end
end
