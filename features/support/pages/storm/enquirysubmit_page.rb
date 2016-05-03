class EnquirySubmitPage
  include PageObject
  include DataMagic

  text_field :first_name, :id => "enquiry_firstName"
  text_field :last_name, :id => "enquiry_lastName"
  text_field :email, :id => "enquiry_email"
  text_field :mobile, :id => "enquiry_phoneNumber"
  button :enquiry_now_btn, :id => "enquiry_submit"

  def fill_in_personal_info(data = {})
    populate_page_with data_for(:personal_info, data)
  end

  def submit_enquiry
    enquiry_now_btn
  end

  def get_full_name
    self.first_name + ' ' + self.last_name
  end

end
