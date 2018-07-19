module PublicMainPageSteps
  def verify_login_button_is_displayed(page)
    error_msg = "Login button is not displayed"
    page.wait_for_inner_content_login_button(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_inner_content_login_button?, error_msg
  end

  def verify_registration_button_is_displayed(page)
    error_msg = "Registration button is not displayed"
    page.wait_for_inner_content_register_button(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_inner_content_register_button?, error_msg
  end
end
