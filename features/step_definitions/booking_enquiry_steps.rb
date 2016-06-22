When(/^I go to a property page$/) do
  visit(PropertyPage)
end

When(/^I click on the first enquiry now button$/) do
  on(PropertyPage).click_first_enquiry_now
  # on(PropertyPage).enquiry_now 1
end

When(/^I fill in personal info$/) do
  on(EnquirySubmitPage) do |page|
    page.fill_in_personal_info
    @student_name = page.get_full_name
    page.submit_enquiry
  end
end

When(/^I create password in the popup dialog$/) do
  on(CreatePasswordDialog).create_password_in_dialog
end

# When(/^I complete the making of an enquiry$/) do
#   on(PropertyPage).click_first_enquiry_now
#   on(EnquirySubmitPage) do |page|
#     page.fill_in_personal_info
#     @student_name = page.get_full_name
#     page.submit_enquiry
#   end
#   on(CreatePasswordDialog).create_password_in_dialog
# end

Then(/^I should find this user in the first enquiry result in the booking system$/) do
  visit(Booking::LoginPage).login
  visit(EnquiryListPage) do |page|
    expect(page.text).to include @student_name
  end
end

When(/^I fill in personal info with existing account$/) do
  on(EnquirySubmitPage) do |page|
    page.fill_in_personal_info('first_name'=>'tim','last_name'=>'auto+2','email'=>'tim.auto+2@student.com')
    @student_name = page.get_full_name
    page.submit_enquiry
  end
end

When(/^I input password in the popup dialog$/) do
  on(InputPasswordDialog).input_password_in_dialog
end

Then(/^I lost this enquiry by student name$/) do
  on(EnquiryListPage).enquiry_need_to_be_lost_by @student_name
  on(EnquiryShowPage).lost_link
  on(EnquiryLostPage).change_to_lost
end

When(/^I go to a property page for "(.*?)"$/) do |locale|
  property_page = PropertyPage.new(@browser)
  property_page.visit_specify_locale_property_page locale
end

When(/^I click the contact an expert button$/) do
  on(PropertyPage).contact_an_expert
end

When(/^I submit enquiry less than six months as a new user$/) do
  on(EnquirySubmitPage) do |page|
    page.fill_in_personal_info

    # @student_name, @student_first_name, @student_last_name are instance variables,
    # can be called cross scenario
    @student_name = page.get_full_name
    @student_first_name = page.first_name
    @student_last_name = page.last_name
    page.select_tenancy_months_less_than_six
    page.submit_enquiry
  end
  on(CreatePasswordDialog).create_password_in_dialog
end

Then(/^I should not find this user in the first enquiry result in the booking system$/) do
  visit(Booking::LoginPage).login
  visit(EnquiryListPage) do |page|
    expect(page.text).not_to include @student_name
  end
end

Then(/^I should find this user in the first student result in the booking system$/) do
  expect(visit(StudentListPage).text).to include @student_first_name, @student_last_name
end

When(/^I click submit button on the enquiry submit page$/) do
  on(EnquirySubmitPage) do |page|
    @student_name = page.get_full_name_filled
    page.enquiry_now_btn
  end
end

When(/^I choose available room category$/) do
  @room_category = on(PropertyPage).choose_available_room_category
  @room_category.click
end

When(/^I choose available listing$/) do
  on(PropertyPage).choose_corresponding_listing @room_category
end

When(/^I select required tenancy$/) do
  on(PropertyPage).choose_required_tenancy
end

When(/^I click enquiry now button$/) do
  on(PropertyPage).click_enquiry_now
end
