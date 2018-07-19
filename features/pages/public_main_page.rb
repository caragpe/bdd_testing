# frozen_string_literal: true

module Pages
  class PublicMainPage < SitePrism::Page

    element :inner_content_login_button , '#home-inner-content a[href*="login"]'
    element :inner_content_register_button , '#home-inner-content a[href*="register"]'
    section :navbar, Sections::NavbarSupportedContentSection , '.navbarSupportedContent'

    def user_starts_login_process
      inner_content_login_button.click
    end

    def user_starts_registration_process
      inner_content_register_button.click
    end
  end
end
