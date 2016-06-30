Given(/^I'm in login page for "(.*?)"$/) do |locale|
  home_page = HomePage.new(@browser)
  home_page.visit_specify_locale_page_without_path locale
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
