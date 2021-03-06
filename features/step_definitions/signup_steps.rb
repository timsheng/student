Given(/^I'm in sign up page$/) do
  visit(HomePage)
  on(HomePage).login_link
  on(LoginPage).signup_link
end

When(/^I fill in all required fields and submit$/) do
  on(SignUpPage).signup
end

Then(/^I can find redirecting included in the page$/) do
  expect(@current_page.text).to include 'Redirecting'
end
