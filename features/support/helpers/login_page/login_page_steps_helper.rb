module LoginPageSteps
  def verify_user_name_input_field_is_displayed(page)
    error_msg = "User name input field is not displayed"
    page.wait_for_user_name_input(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_user_name_input?, error_msg
  end

  def verify_password_input_is_displayed(page)
    error_msg = "Password input field is not displayed"
    page.wait_for_password_input(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_password_input?, error_msg
  end
end
