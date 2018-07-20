include Pages
include UserHelper
include WaitTime

Given /^the user is on the application login screen$/ do
  @main_page = PublicMainPage.new
  visit ENV.fetch('APP_URL')
  verify_login_button_is_displayed(@main_page)
  verify_registration_button_is_displayed(@main_page)
  @main_page.user_starts_login_process
end

When /^the user enters credentials$/ do |user_data|
  @user = User.new(create_hash_with_username_password(user_data))
  @login_page = LoginPage.new
  assert_equal true, @login_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  verify_user_name_input_field_is_displayed(@login_page)
  verify_password_input_is_displayed(@login_page)
  @login_page.user_types_username_and_password(@user)
  @login_page.user_signs_in
end

When /^the user enters his (\w+)$/ do |input_field, input_value|
  @login_page = LoginPage.new
  @login_page.user_types_username(input_value.hashes.first[:value]) if input_field == 'username'
  @login_page.user_types_password(input_value.hashes.first[:value]) if input_field == 'password'
  @login_page.user_signs_in
end

Then /^the application is on the default dashboard screen$/ do
  @default_workspace_page = WorkspacePage.new
  assert_equal true, @default_workspace_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  verify_add_card_button_is_displayed(@default_workspace_page)
end

Then /^the application cannot validate the credentials$/ do
  assert_equal true, @login_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  verify_login_error_is_displayed(@login_page)
end

Then /^the application displays an error on (\w+) input field$/ do |input_field|
  assert_equal true, @login_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  error_msg = "The #{input_field} is NOT displaying an error"
  assert_equal 0, @login_page.user_name_input.text.length, error_msg if input_field == 'username'
  assert_equal 0, @login_page.password_input.text.length, error_msg if input_field == 'password'
end

World(PublicMainPageSteps, LoginPageSteps, WorkspacePageSteps)
