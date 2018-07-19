include Pages
include UserHelper
include WaitTime

Given /^the user is on the application login screen$/ do
  @main_page = PublicMainPage.new
  @user = User.new
  visit ENV.fetch('APP_URL')
  verify_login_button_is_displayed(@main_page)
  verify_registration_button_is_displayed(@main_page)
  @main_page.user_starts_login_process
end

When /^the user enters correct credentials$/ do
  @login_page = LoginPage.new
  assert_equal true, @login_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  verify_user_name_input_field_is_displayed(@login_page)
  verify_password_input_is_displayed(@login_page)
  @login_page.user_types_username_and_password(@user)
  @login_page.user_signs_in
end

When /^the application is on the default dashboard screen$/ do
  @default_workspace_page = WorkspacePage.new
  assert_equal true, @default_workspace_page.displayed?, ENV.fetch('APP_ERROR_INVALID_URL')
  verify_add_card_button_is_displayed(@default_workspace_page)
end

World(PublicMainPageSteps, LoginPageSteps, WorkspacePageSteps)
