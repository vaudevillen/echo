class MapsController < ApplicationController
  include ApplicationHelper

  def index
    @user = current_user
  end


end
