module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def current_user_header_color
    current_user&.header_color || "#510317"
  end
end
