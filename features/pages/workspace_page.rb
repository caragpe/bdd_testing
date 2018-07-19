# frozen_string_literal: true

module Pages
  class WorkspacePage < SitePrism::Page
    set_url_matcher /\/#\//i

    element :add_card, 'input[data-original-title="Add New Card"]'
    section :navbar, Sections::AuthUser::NavbarSupportedContentSection , '.navbarSupportedContent'

  end
end
