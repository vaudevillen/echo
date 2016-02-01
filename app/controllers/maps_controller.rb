class MapsController < ApplicationController
  include ApplicationHelper

  def index
    @user = current_user
    @friends_list = current_user.friends
  end


end
