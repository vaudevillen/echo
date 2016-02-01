class FriendsController < ApplicationController
  include ApplicationHelper

  before_filter :authorize

  def index
    @user = User.find(session[:user_id])
  end

end
