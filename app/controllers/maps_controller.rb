class MapsController < ApplicationController
  include ApplicationHelper

  def index
    @friends_list = current_user.friends
  end


end
