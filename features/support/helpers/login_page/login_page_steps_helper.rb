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

  def create_hash_with_username_password(hash)
    { username: hash.hashes.first["username"], password: hash.hashes.first["password"] }
  end

  def verify_login_error_is_displayed(page)
    error_msg = "The user credentials were expected to fail"
    page.wait_for_invalid_feedback(DEFAULT_WAIT_TIME)
    assert_equal true, page.has_invalid_feedback?, error_msg
  end
end
