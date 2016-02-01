class MapsController < ApplicationController
  include ApplicationHelper

  before_filter :authorize

  respond_to :html, :json

  def index
    user = current_user
    @pins = user.recent_pins
    @friends_list = current_user.friends
  end


  #   def index
  #   pins = Pin.all

  #   respond_to do |format|
  #     format.html do
  #       render component: 'River', props: {
  #         pins: pins.comment},
  #       }, tag: 'div'
  #     end
  #     format.json { render json: pins }
  #   end
  # end

end
