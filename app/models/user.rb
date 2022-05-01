class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  EMAIL_REGEXP = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/i
  NICKNAME_REGEXP = /\A[\w]+\z/

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: NICKNAME_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
