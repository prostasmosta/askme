class User < ApplicationRecord
  include Gravtastic

  EMAIL_REGEXP = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/
  NICKNAME_REGEXP = /\A\w+\z/
  HEADERCOLOR_REGEXP = /\A#[a-f0-9]{6}\z/i

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: NICKNAME_REGEXP }
  validates :header_color, presence: true, format: { with: HEADERCOLOR_REGEXP }

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify

  has_secure_password

  before_save :downcase_nickname

  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
