class Shift < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :date
  validates_presence_of :time

end
