class EnquirySubmitPage
  include PageObject
  include DataMagic
  # DEFAULT_DATA = {
  #   'firstname' => Faker::Name.first_name,
  #   'lastname' => Faker::Name.last_name,
  #   'email' => Faker::Internet.email,
  #   'mobile' => Faker::PhoneNumber.phone_number
  # }

  text_field :firstname, :id => 'enquiry_firstName'
  text_field :lastname, :id => 'enquiry_lastName'
  text_field :email, :id => 'enquiry_email'
  text_field :mobile, :id => 'enquiry_phoneNumber'
  button :enquiry_now_btn, :id => 'enquiry_submit'

  def fill_in_personal_info(data = {})
    # data = DEFAULT_DATA.merge(data)
    # self.firstname = data['firstname']
    # self.lastname = data['lastname']
    # self.email = data['email']
    # self.mobile = data['mobile']
    # populate_page_with DEFAULT_DATA.merge(data)
    populate_page_with data_for(:personal_info, data)
  end

  def submit_enquiry
    enquiry_now_btn
  end

  def get_full_name
    self.firstname + ' ' + self.lastname
  end

end
