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
    page.fill_in_personal_info('firstname'=>'tim','lastname'=>'auto+2','email'=>'tim.auto+2@student.com')
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
