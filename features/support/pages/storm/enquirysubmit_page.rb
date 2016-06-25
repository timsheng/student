class EnquirySubmitPage
  include Helper
  include PageObject
  include DataMagic

  LENGTH_OF_STAY_IS_OTHER = 2
  FIRST_NAME = 0
  LAST_NAME = 1

  text_field :first_name, :id => "enquiry_firstName"
  text_field :last_name, :id => "enquiry_lastName"
  text_field :email, :id => "enquiry_email"
  text_field :mobile, :id => "enquiry_phoneNumber"
  span :tenancy_picker, :id => "picker-button"
  labels :move_in_month, :css => "#move-in-option-pills>div>input[type='radio']:not(:disabled)+label"
  labels :move_out_month, :css => "#move-out-option-pills>div>input[type='radio']:not(:disabled)+label"
  button :enquiry_now_btn, :id => "enquiry_submit"
  text_field :budget_amount, :id => "enquiry_budget_amount"
  select_list :destination_uni, :id => "enquiry_university_selection"
  text_field :other_uni, :id => "enquiry_university_free_text"
  elements :student_info_filled, :strong, :class => "user-detail"

  def fill_in_personal_info(data = {})
    populate_page_with data_for(:personal_info, data)
  end

  def select_move_in_and_move_out_month
    self.tenancy_picker_element.click
    choose_available_move_in_month
    choose_available_move_out_month
  end

  def choose_available_move_in_month
    available_move_in_month = self.move_in_month_elements.sample
    available_move_in_month.when_present.click
  end

  def choose_available_move_out_month
    available_move_out_month = self.move_out_month_elements.sample
    available_move_out_month.when_present.click
  end

  def select_destination_uni
    uni = get_random_select_value_without_default self.destination_uni_options
    if uni == 'Other'
      self.other_uni = 'test uni'
    else
      self.destination_uni = uni
    end
  end

  def fill_in_cae_required_info(data = {})
    fill_in_personal_info(data = {})
    select_move_in_and_move_out_month
    self.budget_amount = '1000'
    select_destination_uni
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
