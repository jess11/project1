# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :post, class_name: "Post"
  validates :user_id, :presence => true
  validates :post_id, :presence => true
  
end
