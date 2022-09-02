class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :friend_requests
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships
  has_many :friends, through: :friendships

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
end
