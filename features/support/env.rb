require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'
require 'minitest/spec'
require 'pry'

require 'require_all'

Dotenv.load '.env'

require_all './features/pages/**/*.rb'

Before do
  Capybara.current_session.current_window.resize_to(1920, 1080)
end

Capybara.default_driver = :chrome

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

After do |scenario|
  Capybara.current_session.driver.quit
end
