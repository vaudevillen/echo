class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :pins
  has_many :songs, through: :pins
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

  def self.search(query)
    where("first_name like ? or last_name like ?", "%#{query}%", "%#{query}%")
  end

end