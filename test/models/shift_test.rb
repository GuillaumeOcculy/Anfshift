# == Schema Information
#
# Table name: shifts
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  description :string(255)
#  job         :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
