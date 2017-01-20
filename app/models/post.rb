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
end
