When(/^I go to a property page$/) do
  visit(PropertyPage)
end

# When(/^I click on the first enquiry now button$/) do
#   on(PropertyPage).click_first_enquiry_now
#   # on(PropertyPage).enquiry_now 1
# end
#
# When(/^I fill in personal info$/) do
#   on(EnquirySubmitPage) do |page|
#     page.fill_in_personal_info
#     @student_name = page.get_full_name
#   end
# end
#
# When(/^I create password in the popup dialog$/) do
#   on(CreatePasswordDialog).create_password_in_dialog
# end
When(/^I complete the making of an enquiry$/) do
  on(PropertyPage).click_first_enquiry_now
  on(EnquirySubmitPage) do |page|
    page.fill_in_personal_info
    @student_name = page.get_full_name
    page.submit_enquiry
  end
  on(CreatePasswordDialog).create_password_in_dialog
end

Then(/^I should find new user in the first enquiry result in the booking system$/) do
  visit(Booking::LoginPage).login
  visit(EnquiryListPage) do |page|
    expect(page.text).to include @student_name
  end
end
