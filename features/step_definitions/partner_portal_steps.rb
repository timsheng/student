When(/^I get into Partner Portal$/) do
  on(HomePage).partner_portal_link
  on(PartnerPortalDialog) do |page|
    page.input_partner_code
    page.save_partner_code
  end
end

When(/^I submit enquiry for new student on partner portal$/) do
  on(PartnerPortalPage) do |page|
    page.fill_in_student_details
    page.choose_contact_person
    page.partner_application_submit
  end
end

Then(/^I can see success included in url$/) do
  expect(@current_page.current_url).to include 'success'
end
