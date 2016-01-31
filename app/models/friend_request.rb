class FriendRequest < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  after_initialize do
    self.status ||= false
  end
  
end