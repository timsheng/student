class PartnerPortalPage
  include Helper
  include PageObject
  include DataMagic

  text_field :destination_uni, :id => "partner_application_studentRequirements_studyDestinationUni"
  unordered_list :autosuggest_uni, :class =>"suggest-group"
  select_list :arrival_month, :id => "partner_application_studentRequirements_studyAbroadDate"
  select_list :length_of_study, :id => "partner_application_studentDetails_lengthOfStay"
  text_field :first_name, :id => "partner_application_userInfo_firstName"
  text_field :last_name, :id => "partner_application_userInfo_lastName"
  text_field :student_email, :id => "partner_application_studentEmail_first"
  text_field :confirm_student_email, :id => "partner_application_studentEmail_second"
  text_field :phone_number, :id => "partner_application_userInfo_phoneNumber"
  text_field :current_school, :id => "partner_application_studentDetails_studyCurrentUni"
  text_area :other_requirement, :id => "partner_application_studentRequirements_otherPreferences"
  radio_button :not_has_contact, :id => "not-has-contact"
  radio_button :has_contact, :id => "has-contact"
  text_field :contact_first_name, :id => "partner_application_studentDetails_contactPersonFirstName"
  text_field :contact_last_name, :id => "partner_application_studentDetails_contactPersonLastName"
  text_field :contact_email, :id => "partner_application_contactPersonEmail"
  text_field :contact_phone, :id => "partner_application_studentDetails_contactPersonPhone"
  text_field :referrer_name, :id => "partner_application_studentDetails_referrerName"
  text_field :referrer_email, :id => "partner_application_referrerEmail"
  button :partner_application_submit, :id => "partner_application_submit"

  def select_random_uni university
    self.destination_uni = university
    autosuggest_uni_element.when_present(3)
    autosuggest_uni_element.list_items.sample.when_present.click
  end

  def select_random_arrival_month
    month = get_random_select_value_without_default self.arrival_month_options
    self.arrival_month = month
  end

  def select_random_length_of_study
    length = get_random_select_value_without_default self.length_of_study_options
    self.length_of_study = length
  end

  def fill_in_student_info(data = {})
    populate_page_with data_for(:partner, data)
  end

  def input_confirm_email
    self.confirm_student_email = self.student_email
  end

  def fill_in_student_details    
    select_random_arrival_month
    select_random_length_of_study
    fill_in_student_info
    input_confirm_email
  end

  def fill_in_contact_person_details(data = {})
    populate_page_with data_for(:contact_info, data)
  end

  def fill_in_referrer_details(data = {})
    populate_page_with data_for(:referrer_info, data)
  end

  def fill_in_contact_person_details yes_or_no
    if yes_or_no == "yes"
      choose_contact_person_yes
      fill_in_contact_person_details(data = {})
    else
      choose_contact_person_no
    end
  end

  def choose_contact_person_no
    not_has_contact_element.fire_event :click
  end

  def choose_contact_person_yes
    has_contact_element.fire_event :click
  end

end
