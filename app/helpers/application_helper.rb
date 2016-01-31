module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_friend?(potential_friend)
    current_user.friends.each do |friend|
      if friend.id == potential_friend
        return true
      end
    end
    false
  end

  def request_sent?(id)
    FriendRequest.find_by(sender_id: session[:user_id], recipient_id: id, status: false)
  end

  def request_received?(id)
    FriendRequest.find_by(sender_id: id, recipient_id: session[:user_id], status: false)
  end

  def find_request(id)
    return FriendRequest.find_by(sender_id: session[:user_id], recipient_id: id) || FriendRequest.find_by(sender_id: id, recipient_id: session[:user_id])
  end

end
