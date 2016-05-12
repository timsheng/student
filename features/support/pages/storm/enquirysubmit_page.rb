class EnquirySubmitPage
  include PageObject
  include DataMagic

  LENGTH_OF_STAY_IS_OTHER = 2
  FIRST_NAME = 0
  LAST_NAME = 1

  text_field :first_name, :id => "enquiry_firstName"
  text_field :last_name, :id => "enquiry_lastName"
  text_field :email, :id => "enquiry_email"
  text_field :mobile, :id => "enquiry_phoneNumber"
  elements :length_of_stay, :label, :class => "radio-label"
  select_list :tenancy_months, :id => "enquiry_tenancyMonths"
  button :enquiry_now_btn, :id => "enquiry_submit"
  elements :student_info_filled, :strong, :class => "user-detail"

  def fill_in_personal_info(data = {})
    populate_page_with data_for(:personal_info, data)
  end

  def select_tenancy_months_less_than_six
    select_other_length_of_stay
    tenancy_months = self.get_tenancy_months
  end

  def select_other_length_of_stay
    length_of_stay_elements[LENGTH_OF_STAY_IS_OTHER].click
  end

  def get_tenancy_months
    months = self.tenancy_months_options
    return months[0...6].sample
  end

  def submit_enquiry
    enquiry_now_btn
  end

  def get_full_name
    self.first_name + ' ' + self.last_name
  end

  def get_full_name_filled
    first_name_filled = self.student_info_filled_elements[FIRST_NAME].text
    last_name_filled = self.student_info_filled_elements[LAST_NAME].text
    return first_name_filled + ' ' + last_name_filled
  end

end
