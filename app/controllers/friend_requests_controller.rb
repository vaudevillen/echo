class FriendRequestsController < ApplicationController
  include ApplicationHelper

  def create
    @request = FriendRequest.create(request_params)
    redirect_to :back
  end

  def destroy
    @request = find_request(request_params[:id])
    @request.destroy
    redirect_to :back
  end

  def update
    @request = find_request(request_params[:id])
    @request.update(status: true)
    redirect_to :back
  end

  private
  def request_params
    params.permit(:id, :sender_id, :recipient_id, :status)
  end

end