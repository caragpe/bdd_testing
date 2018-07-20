# frozen_string_literal: true

module Pages
  class LoginPage < SitePrism::Page
    set_url_matcher /\/login/i

    element :user_name_input, '#email'
    element :password_input, '#password'
    element :remember_me, 'input[name="remember"]'
    element :sign_in_button, 'button[type="submit"]'
    element :card_header_register_link, '.card a[href*="register"]'
    element :card_header_reset_link, '.card a[href*="reset"]'
    section :navbar, Sections::NavbarSupportedContentSection , '.navbarSupportedContent'
    element :invalid_feedback, '.invalid-feedback'

    def user_types_username_and_password(user)
      user_types_username(user.username)
      user_types_password(user.password)
    end

    def user_types_username(username)
      user_name_input.send_keys username
    end

    def user_types_password(password)
      password_input.send_keys password
    end

    def user_signs_in
      sign_in_button.click
    end
  end
end
