# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  job             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#  slug            :string(255)
#  name            :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
