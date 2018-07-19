module WorkspacePageSteps
  def verify_add_card_button_is_displayed(page)
    error_msg = "Add card button is not displayed"
    page.wait_for_add_card(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_add_card?, error_msg
  end
end
