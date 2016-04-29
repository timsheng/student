class ApplicationDetailsPage
  include PageObject
  include DataMagic
  include Helper
  page_url "#{FigNewton.base_url}/my-account/application-details"

  link :my_account_link, :class => "primary-link subnav-link my-account"
  link :logout_link, :href => "/my-account/logout"

  h1 :user_name, :class => "username"
  span :profile_percentage, :class => "completed-amount"
  text_field :first_name, :id => "application_details_firstName"
  text_field :last_name, :id => "application_details_lastName"
  text_field :student_mobile, :id => "application_details_phoneNumber"
  select_list :gender, :id => "application_details_studentProfile_gender"
  text_field :date_of_birth, :id => "application_details_studentProfile_dateOfBirth"
  select_list :nationality, :id => "application_details_studentProfile_nationality"
  text_field :current_school, :id => "application_details_studentProfile_studyCurrentUni"
  text_field :abroad_date, :id => "application_details_studentProfile_studyAbroadDate"
  select_list :destination_uni, :id => "application_details_studentProfile_studyDestinationUni_selection"
  select_list :academic_year, :id => "application_details_studentProfile_academicYear"
  text_field :major, :id => "application_details_studentProfile_studyMajor"
  text_field :first_address, :id => "application_details_studentProfile_mailingAddress_addressLine1"
  text_field :second_address, :id => "application_details_studentProfile_mailingAddress_addressLine2"
  text_field :city, :id => "application_details_studentProfile_mailingAddress_city"
  text_field :state, :id => "application_details_studentProfile_mailingAddress_state"
  text_field :zip_code, :id => "application_details_studentProfile_mailingAddress_zipCode"
  select_list :country, :id => "application_details_studentProfile_mailingAddress_country"
  select_list :roommate_preferences, :id => "application_details_studentProfile_flatGender"
  select_list :smoking_preferences, :id => "application_details_studentProfile_smoking"
  select_list :vegetarian_preferences, :id => "application_details_studentProfile_vegetarian"
  text_field :guarantor_first_name, :id => "application_details_studentProfile_guarantor_firstName"
  text_field :guarantor_last_name, :id => "application_details_studentProfile_guarantor_lastName"
  select_list :relationship, :id => "application_details_studentProfile_guarantor_relationshipWithStudent"
  text_field :guarantor_date_of_birth, :id => "application_details_studentProfile_guarantor_dateOfBirth"
  text_field :guarantor_email, :id => "application_details_studentProfile_guarantor_email"
  text_field :guarantor_mobile, :id => "application_details_studentProfile_guarantor_phone"
  text_field :guarantor_first_address, :id => "application_details_studentProfile_guarantor_mailingAddress_addressLine1"
  text_field :guarantor_second_address, :id => "application_details_studentProfile_guarantor_mailingAddress_addressLine2"
  text_field :guarantor_city, :id => "application_details_studentProfile_guarantor_mailingAddress_city"
  text_field :guarantor_state, :id => "application_details_studentProfile_guarantor_mailingAddress_state"
  text_field :guarantor_zip_code, :id => "application_details_studentProfile_guarantor_mailingAddress_zipCode"
  select_list :guarantor_country, :id => "application_details_studentProfile_guarantor_mailingAddress_country"
  select_list :how_did_you_hear_about_us, :id => "application_details_studentProfile_howDidYouHearAboutUs"
  text_area :other_requirement, :id => "application_details_studentProfile_otherPreferences"
  button :submit_details, :id => "application_details_submit"

  def get_random_gender
    gender = get_random_select_value_without_default self.gender_options
    self.gender = gender
  end

  def get_random_nationality
    nationality = get_random_select_value_without_default self.nationality_options
    self.nationality = nationality
  end

  def get_random_destination_uni
    uni = get_random_select_value_without_default self.destination_uni_options
    self.destination_uni = uni
  end

  def get_random_academic_year
    academic = get_random_select_value_without_default self.academic_year_options
    self.academic_year = academic
  end

  def get_random_country
    country = get_random_select_value_without_default self.country_options
    self.country = country
  end

  def get_random_roommate_preference
    roommate_preference = get_random_select_value_without_default self.roommate_preferences_options
    self.roommate_preferences = roommate_preference
  end

  def get_random_smoking_preference
    smoking_preference = get_random_select_value_without_default self.smoking_preferences_options
    self.smoking_preferences = smoking_preference
  end

  def get_random_vegetarian_preference
    vegetarian_preference = get_random_select_value_without_default self.vegetarian_preferences_options
    self.vegetarian_preferences = vegetarian_preference
  end

  def get_random_relationship
    relationship = get_random_select_value_without_default self.relationship_options
    self.relationship = relationship
  end

  def get_random_guarantor_country
    country = get_random_select_value_without_default self.guarantor_country_options
    self.guarantor_country = country
  end

  def get_random_how_did_you_hear_about_us
    how_did_you_hear_about_us = get_random_select_value_without_default self.how_did_you_hear_about_us_options
    self.how_did_you_hear_about_us = how_did_you_hear_about_us
  end

  def fill_in_select_list
    self.get_random_gender
    self.get_random_nationality
    self.get_random_destination_uni
    self.get_random_academic_year
    self.get_random_country
    self.get_random_roommate_preference
    self.get_random_smoking_preference
    self.get_random_vegetarian_preference
    self.get_random_relationship
    self.get_random_guarantor_country
    self.get_random_how_did_you_hear_about_us
  end

  def fill_in_user_profile(data = {})
    populate_page_with data_for(:user_profile, data)
    self.fill_in_select_list
  end

  def get_user_name
    self.first_name + ' ' + self.last_name
  end
end
