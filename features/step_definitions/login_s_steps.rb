Given(/^I'm in login page$/) do
  visit(HomePage)
  on(HomePage).login_link
end

When(/^I fill in account and password field and submit login$/) do
  on(LoginPage).login
end

Then(/^I should see logout on the dropdown list of my account$/) do
  on(ApplicationDetailsPage) do |page|
    page.my_account_link
    expect(page.logout_link_element.visible?).to be true
  end
end
