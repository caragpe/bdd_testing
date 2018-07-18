# frozen_string_literal: true

module Pages
  class LoginPage < SitePrism::Page
    set_url_matcher /\/login/i

    attr_reader :username, :password

    element :user_name_input, '#email'
    element :password_input, '#password'
    element :remember_me, 'input[name="remember"]'
    element :sign_in_button, 'button[type="submit"]'
    element :card_header_register_link, '.card a[href*="register"]'
    element :card_header_reset_link, '.card a[href*="reset"]'
    section :navbar, Sections::NavbarSupportedContentSection , '.navbarSupportedContent'
    element :error_notification_content, '.error.message > div >div:first-of-type'
    element :password_display_toggle, 'span[class*="SemanticUiPasswordInput__StyledSpan"]'

    def set_username_password(user)
      @username = user.username
      @password = user.password
    end

    def user_types_username_and_password(user)
      set_username_password(user)
      user_name_input.send_keys username
      password_input.send_keys password
    end

    def user_signs_in
      sign_in_button.click
    end
  end
end
