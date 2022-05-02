class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/
  NICKNAME_REGEXP = /\A\w+\z/
  HEADERCOLOR_REGEXP = /\A#[a-f0-9]{6}\z/i

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: NICKNAME_REGEXP }
  validates :header_color, presence: true, format: { with: HEADERCOLOR_REGEXP }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
