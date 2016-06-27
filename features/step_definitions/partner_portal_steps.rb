When(/^I get into Partner Portal$/) do
  on(HomePage).partner_portal_link
  on(PartnerPortalDialog) do |page|
    page.input_partner_code
    page.save_partner_code
  end
end

Then(/^I fill in student details with "(.*?)"$/) do |university|
  on(PartnerPortalPage) do |page|
    page.select_random_uni university
    page.fill_in_student_details
  end
end

And(/^I choose contact person as "(.*?)"$/) do |yes_or_no|
  on(PartnerPortalPage).fill_in_contact_person_details yes_or_no
end

And(/^I fill in referrer details and submit$/) do
  on(PartnerPortalPage) do |page|
    page.fill_in_referrer_details
    page.partner_application_submit
  end
end

Then(/^I can see success included in url$/) do
  expect(@current_page.current_url).to include 'success'
end
