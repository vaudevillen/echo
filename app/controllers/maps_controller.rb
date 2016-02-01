class MapsController < ApplicationController
  include ApplicationHelper

  respond_to :html, :json

  def index
    @pins = Pin.all
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
