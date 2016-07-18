When(/^I click left floating widget$/) do
  on(HomePage).click_left_floating_widget
end

Then(/^I should see "(.*?)" on the popup window$/) do |qr_hint|
  expect(@current_page.text).to include qr_hint
end

Then(/^I can close the popup window$/) do
  on(HomePage).close_wechat_widget
end

When(/^I click wechat on social widget$/) do
  on(HomePage) do |page|
    page.click_wechat_sidebar_icon
    page.click_wechat_social_widget
  end
end

Given(/^I'm on help page$/) do
  visit(HelpPage)
end

When(/^I click wechat long banner$/) do
  on(HelpPage).click_wechat_long_banner
end

Given(/^I'm on SRP page$/) do
  steps %{
    Given I'm on CN homepage
    When I input "London" in the hero banner searchbox
    When I click search button
  }
end

When(/^I click wechat conversation button$/) do
  on(SearchResultPage).click_wechat_conversation_button
end

When(/^I scroll down and click left floating widget$/) do
  on(PropertyPage).click_left_floating_widget_pp
end

When(/^I click the right wechat short banner$/) do
  on(PropertyPage).click_wechat_short_banner_right
end
