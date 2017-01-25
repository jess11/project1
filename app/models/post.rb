# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  tweet      :text
#  likes      :integer          default("0")
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope { order(created_at: :desc) }
  validates :tweet, :presence => true, :length => { :maximum => 140}
  has_many :likes

  def likeit(like_user)
      likes.create(user_id: like_user.id )
  end

end
