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
#  goals           :integer          default("0")
#  assists         :integer          default("0")
#  penalties       :integer          default("0")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  games_played    :integer
#  deleted_at      :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
