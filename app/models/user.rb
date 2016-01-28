class User < ActiveRecord::Base
  has_many :pins
  has_many :songs, through: :pins

end