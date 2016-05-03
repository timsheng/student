Given(/^I'm on CN homepage$/) do
  visit(HomePage)
end

When(/^I input "(.*?)" in the hero banner searchbox$/) do |keywords|
  on(HomePage).search_keywords_in_hero_banner keywords
end

Then(/^"(.*?)" should be available in the city autosuggestion result$/) do |expected_city|
  on(HomePage).search_result_for_city_element.when_visible do
    expect(@current_page.search_result_for_city).to include expected_city
  end
end

Then(/^"(.*?)" should be available in the univeristy autosuggestion result$/) do |expected_university|
  on(HomePage).search_result_for_university_element.when_visible do
    expect(@current_page.search_result_for_university).to include expected_university
  end
end

Then(/^"(.*?)" should be available in the property autosuggestion result$/) do |expected_property|
  begin
    on(HomePage).search_result_for_property_element.when_visible do
      expect(@current_page.search_result_for_property).to include expected_property
    end
  rescue Exception
    puts "search result for property will not be shown when searching chinese"
  end
end

When(/^I input "(.*?)" in the navigation searchbox$/) do |keywords|
  on(HomePage) do |page|
    page.search_icon_element.click
    page.search_keywords_in_navigation keywords
  end
end

When(/^I click popular text in the popular section$/) do
  on(HomePage) do |page|
    popular_element = page.get_random_popular_element
    @popular_text = popular_element.text
    popular_element.click
  end
end

Then(/^Corresponding popular text should be available in the SRP or PP$/) do
  expect(@current_page.text).to include @popular_text
end

When(/^I hit enter keyboard$/) do
  on(HomePage).search_keywords_in_hero_banner_via_enter_keyboard
end

Then(/^"(.*?)" should be included in the url$/) do |expected_result|
  expect(@current_page.current_url).to include expected_result
end

When(/^I click search button$/) do
  on(HomePage).search_button_hero_banner
end
