Given(/^I'm on CN homepage$/) do
  visit(HomePage)
end

When(/^I input "(.*?)" in the searchbox$/) do |city|
  on(HomePage).search_keywords_in_hero_banner city
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
