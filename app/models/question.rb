class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  # before_save :set_author_id

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  #private

  # def set_author_id
  #   if current_user.present?
  #     @question[:author_id] = current_user.id
  #   end
  # end
end
