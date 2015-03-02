# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  job             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  # Secure password
  has_secure_password

  # Before
  before_save { self.email = email.downcase }

  # Associations
  has_many :shifts,   dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 5 }
  validates :job, presence: true

  # Public Methods
  def name
    "#{self.first_name} #{self.last_name}"
  end

end
