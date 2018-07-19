# frozen_string_literal: true

module Sections
  module AuthUser
    class NavbarSupportedContentSection < SitePrism::Section
      element :workspace_selector, '#workspace-selector'
      element :search_tool, 'input[placeholder*="Search for..."]'
      element :user_menu, '#navbarDropdown'
    end
  end
end
