class CreatePasswordDialog
  include PageObject
  include DataMagic

  # DEFAULT_DATA = {
  #   'password' => 'abc20052614'
  # }

  text_field :password, :id => 'create_password_password'
  button :save_password_btn, :id => 'create_password_create'

  def create_password_in_dialog(data = {})
    # populate_page_with DEFAULT_DATA.merge(data)
    populate_page_with data_for(:create_password,data)
    save_password_btn
  end
end
