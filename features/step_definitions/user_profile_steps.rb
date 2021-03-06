Given(/^The existing user logged in$/) do
  steps %{
    Given I'm in login page
    When I fill in account and password field and submit login
  }
end

When(/^The user update profile in application details page$/) do
  on(ApplicationDetailsPage) do |page|
    page.fill_in_user_profile
    @user_name = page.get_user_name
    page.submit_details
  end
end

Then(/^The username has been changed to new one\.$/) do
  expect(on(ApplicationDetailsPage).user_name).to eql @user_name
end

Given(/^The new user get into application deatils page$/) do
  steps %{
    Given I'm in sign up page
    When I fill in all required fields and submit
  }
  visit(ApplicationDetailsPage)
end

Then(/^Profile percentage should be (\d+)%$/) do |arg1|
  expect(on(ApplicationDetailsPage).profile_percentage).to eql "100%"
end
