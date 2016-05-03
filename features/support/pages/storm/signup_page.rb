class SignUpPage
  include PageObject
  include DataMagic

  text_field :first_name, :id => "registration_user_firstName"
  text_field :last_name, :id => "registration_user_lastName"
  text_field :email, :id => "registration_user_email"
  text_field :mobile, :id => "registration_user_phoneNumber"
  text_field :password, :id => "registration_user_password"
  checkbox :accept_terms, :id => "registration_terms"
  button :register, :id => "registration_register"

  def signup(data = {})
    populate_page_with data_for(:signup,data)
    check_accept_terms
    register
  end

end
