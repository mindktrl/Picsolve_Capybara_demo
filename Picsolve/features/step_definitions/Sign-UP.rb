require 'capybara'
require 'capybara/dsl'
include Capybara::DSL
Capybara.app_host='localhost:4567'
Capybara.default_selector=:css
Capybara.default_driver=:selenium
Capybara.register_driver :selenium do|app|
  driver=Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
browser = Capybara.current_session.driver.browser
Capybara.default_wait_time = 15
browser.manage.delete_all_cookies

Given(/^I am on the homepage/) do
  visit "https://www.picsolve.com/#/dashboard"
end

When(/^I select the register link/) do
    click_on  "Register"
end

When(/^Picsolve account does not exist/) do
  choose 'No'
end

Then (/^I can enter new registration details/) do
  find('#email').set 'test@nodomain.com'
  find('#email-confirm').set 'test@nodomain.com'
  find('#register-password').set '1q2w3e4r'
  find('#register-password-confirm').set '1q2w3e4r'
  click_on "Register" # << Uncomment to click Register
end



