# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  avatar          :string
#  phone           :string
#  bio             :text
#  role            :string
#  active          :boolean          default("true")
#  admin           :boolean          default("false")
#  goals           :integer
#  assists         :integer
#  penalties       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
