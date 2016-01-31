class PinsController < ApplicationController
  include ApplicationHelper
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
    user = current_user
    @pin = Pin.new(song_id: params[:song_id], user_id: user.id, latitude: params[:lat], longitude: params[:lng], song_id: params[:song_id])
    @pin.save
    redirect_to :back
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

  end

end
