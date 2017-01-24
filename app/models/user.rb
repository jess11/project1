# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :text
#  image           :text
#  location        :text
#  password_digest :string
#  admin           :boolean          default("false")
#

class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end


  has_secure_password
  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 5 }
end
