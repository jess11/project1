# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  default_scope { order(created_at: :desc) }
  validates :message, :presence => true, :length => { :maximum => 140}
end
