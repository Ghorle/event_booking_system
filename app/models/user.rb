class User < ApplicationRecord
  before_validation :set_uid

  # Include default devise modules.
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  include DeviseTokenAuth::Concerns::User

  enum role: { organizer: "organizer", customer: "customer" }
  validates :role, presence: true

  private

  def set_uid
    self.uid = email if uid.blank?
  end
end
