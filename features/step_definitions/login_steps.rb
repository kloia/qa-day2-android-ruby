login_page = LoginPage.new
Given(/^fill user name with "([^"]*)" on login page$/) do |username|
  login_page.fill_user_name(username)
end

And(/^fill password with "([^"]*)" on login page$/) do |username|
  login_page.fill_password(username)
end

When(/^click login button on login page$/) do
  login_page.click_login_button
end

Then(/^verify login$/) do
  login_page.verify_login
end