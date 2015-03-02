class User < ActiveRecord::Base

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :job, presence: true


  # Public Methods
  def name
    "#{self.first_name} #{self.last_name}"
  end

end
