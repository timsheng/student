Given(/^I'm in sign up page for "(.*?)"$/) do |locale|
  home_page = HomePage.new(@browser)
  home_page.visit_specify_locale_page_without_path locale
  on(HomePage).login_link
  on(LoginPage).signup_link
end

When(/^I fill in all required fields and submit$/) do
  on(SignUpPage).signup
end

Then(/^I can find redirecting included in the page$/) do
  expect(@current_page.text).to include 'Redirecting'
end
