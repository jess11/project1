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
#  latitude        :float
#  longitude       :float
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
