class FriendsController < ApplicationController
  include ApplicationHelper

  before_filter :authorize

  def index
    @user = User.find(session[:user_id])
     render :layout => "profile_layout"
  end

end
