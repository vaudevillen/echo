class PinsController < ApplicationController
  def index
    friend = User.find(2)
    if friend != nil
      @pins = Pin.where(user: friend)
    else
      @pins = Pin.all
    end
    if request.xhr?
        respond_to do |format|
          format.json { render json: @pins }
        end
    end
  end

  def create
    pin = Pin.new(song: Song.first, user: User.last, latitude: params[:lat], longitude: params[:lng])
    if pin.save

    end
  end
end
