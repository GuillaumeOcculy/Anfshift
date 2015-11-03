# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  shift_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :shift

  # Scopes
  scope :recent, -> { order('created_at desc') }

  # Validations
  validates_presence_of :content
  
end
