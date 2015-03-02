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

class Shift < ActiveRecord::Base

  # Before
  before_create :set_job

  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :description


  def set_job
    self.job = user.job
  end
end
