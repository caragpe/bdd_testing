# frozen_string_literal: true
module Sections
  class NavbarSupportedContentSection < SitePrism::Section

    elements :navbar_links, 'li'

    def home_link
      wait_for_user_name(DEFAULT_WAIT_TIME)
      user_name.click
    end

    def login_link
      wait_for_logout_button(DEFAULT_WAIT_TIME)
      logout_button.click
    end

    def register_link
      wait_for_patients_link(DEFAULT_WAIT_TIME)
      patients_link.click
    end

    def contact_link
      wait_for_account_settings(DEFAULT_WAIT_TIME)
      account_settings.click
    end
  end
end
