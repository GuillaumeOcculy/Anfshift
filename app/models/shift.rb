# == Schema Information
#
# Table name: shifts
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  description :text(255)
#  job         :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Shift < ActiveRecord::Base

  # Before
  before_create { self.job = user.job }

  # Scopes
  scope :by_job,  ->(user)  { where(job: user.job) }

  # Associations
  belongs_to :user
  has_many   :comments, dependent: :destroy

  # Validations
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :description

end
