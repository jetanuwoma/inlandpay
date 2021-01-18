# frozen_string_literal: true

class UserDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def last_login
    last_sign_in_at.strftime('%F')
  end
end
