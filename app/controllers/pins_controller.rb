class PinsController < ApplicationController
  def index
    @pins = Pin.all
    if request.xhr?
        respond_to do |format|
          format.json { render json: @pins }
        end
    end
  end

  def show
    @friend_pins = Pin.where(user_id: params[:user_id])
    if request.xhr?
        respond_to do |format|
          format.json { render json: @friend_pins }
        end
    end
  end

  def create
    pin = Pin.new(song: Song.first, user: User.last, latitude: params[:lat], longitude: params[:lng], song_id: params[:song_id])
    pin.save
    redirect_to :back
  end
end
