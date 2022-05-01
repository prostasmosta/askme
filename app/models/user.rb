class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/i}
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[a-z_1-9]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
