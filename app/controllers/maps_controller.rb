class MapsController < ApplicationController
  include ApplicationHelper

  before_filter :authorize

  respond_to :html, :json

  def index
    if request.xhr?
      render :json => current_user.recent_pins
    end
    user = current_user
    @pins = user.recent_pins
    @friends_list = current_user.friends
  end

end
