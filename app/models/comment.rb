# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  tweet      :text
#  likes      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end