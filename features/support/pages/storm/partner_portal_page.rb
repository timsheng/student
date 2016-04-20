class PartnerPortalPage
  include Helper
  include PageObject
  include DataMagic

  select_list :destination_city, :id => "partner_application_studentRequirements_cityOfStudy"

  select_list :destination_uni, :id => "partner_application_studentRequirements_studyDestinationUni"

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

  text_field :referrer_name, :id => "partner_application_studentDetails_referrerName"

  text_field :referrer_email, :id => "partner_application_referrerEmail"

  button :partner_application_submit, :id => "partner_application_submit"

  def select_random_city
    city = get_random_array_value_without_default self.destination_city_options
    self.destination_city = city
  end

  def select_random_uni
    uni = get_random_array_value_without_default self.destination_uni_options
    self.destination_uni = uni
  end

  def select_random_arrival_month
    month = get_random_array_value_without_default self.arrival_month_options
    self.arrival_month = month
  end

  def select_random_length_of_study
    length = get_random_array_value_without_default self.length_of_study_options
    self.length_of_study = length
  end

  def fill_in_student_info(data = {})
    populate_page_with data_for(:partner, data)
  end

  def input_confirm_email
    self.confirm_student_email = self.student_email
  end

  def fill_in_student_details
    select_random_city
    begin
    select_random_uni
    rescue
      puts "uni is not available"
    end
    select_random_arrival_month
    select_random_length_of_study
    fill_in_student_info
    input_confirm_email
  end

  def choose_contact_person
    select_not_has_contact
  end

end
