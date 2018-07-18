include Pages
include UserHelper
include WaitTime


Given /^the user is on the application login screen$/ do
  @login_page = LoginPage.new
  visit ENV.fetch('APP_URL')
  binding.pry
end
