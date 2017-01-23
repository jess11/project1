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
  has_secure_password
  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 5 }
end
