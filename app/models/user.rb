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

class User < ActiveRecord::Base

  # Secure password
  has_secure_password

  # Before
  before_save { self.email = email.downcase }

  # FriendlyID
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  has_many :shifts,   dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 5 }
  validates :job, presence: true
  validates_inclusion_of :job, :in => ["impact_1", "impact_2", "cashier", "model", "ops", "stylist"]

  # Public Methods
  def first_name

  end

end
