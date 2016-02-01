class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :pins
  has_many :songs, through: :pins
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :received_requests, class_name: "FriendRequest", foreign_key: :recipient_id
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
  end

  def self.search(query)
    where("first_name like ? or last_name like ?", "%#{query}%", "%#{query}%")
  end

end
