# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  tweet      :text
#  likes      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope { order(created_at: :desc) }
  validates :tweet, :presence => true, :length => { :maximum => 140}
end
