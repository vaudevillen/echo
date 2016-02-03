class User < ActiveRecord::Base
  include ApplicationHelper

  has_many :pins
  has_many :songs, through: :pins
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :received_requests, class_name: "FriendRequest", foreign_key: :recipient_id
  has_attached_file :avatar, default_url: "http://s3.amazonaws.com/dbcecho/users/avatars/000/000/016/thumb/stick.png", styles: {
    thumb: '100x100>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true

# This method associates the attribute ":avatar" with a file attachment

  # Validate the attached image is image/jpg, image/png, etc

  has_secure_password

  def friends
    all_friends= []
    self.sent_requests.each do |req|
      all_friends << User.find(req.recipient_id) if req.status == true
    end
    self.received_requests.each do |req|
      all_friends << User.find(req.sender_id) if req.status == true
    end
    all_friends
  end

  def fullname
    self.first_name + " " + self.last_name
  end

  def location
    self.city + ", " + self.state
  end

  def recent_pins
    recent = []
    result = []
    self.friends.each do |friend|
      friend.pins.each do |pin|
        recent << pin
      end
    end
    recent.sort!{|a,b| b.created_at <=> a.created_at}
    result << recent[0] << recent[1]
    pinparse(result)
  end

  def pinparse(pins)
    return pins if pins[0] && pins[1] != nil
    pins.pop
    return pins
  end

  def self.search(query)
    where("first_name ilike ? or last_name ilike ?", "%#{query}%", "%#{query}%")
  end

end
