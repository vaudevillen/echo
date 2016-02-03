class FriendRequestsController < ApplicationController
  include ApplicationHelper
  before_filter :authorize
  def create
    @request = FriendRequest.create(request_params)
    if request.xhr?
      render partial:'/friends/pending'
    else
      redirect_to :back
    end
  end

  def destroy
    @request = find_request(request_params[:id])
    @request.destroy
    redirect_to :back
  end

  def update
    @request = find_request(request_params[:id])
    @request.update(status: true)
    if request.xhr?
      render partial:'/friends/accept'
    else
      redirect_to :back
    end
  end

  private
  def request_params
    params.permit(:id, :sender_id, :recipient_id, :status)
  end

end
