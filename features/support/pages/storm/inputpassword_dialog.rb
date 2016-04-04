class InputPasswordDialog
  include PageObject
  include DataMagic
  text_field :password, :id => "password"
  button :login_btn, :id => "login"

  def input_password_in_dialog(data = {})
    populate_page_with data_for(:existing_user_popup, data)
    login_btn
  end

end
