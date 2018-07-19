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
  @login_page.displayed?
  verify_user_name_input_field_is_displayed(@login_page)
  verify_password_input_is_displayed(@login_page)
  @login_page.user_types_username_and_password(@user)
  @login_page.user_signs_in
end

When /^the application is on the default dashboard screen$/ do
  binding.pry
end

World(PublicMainPageSteps, LoginPageSteps)
