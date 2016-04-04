class CreatePasswordDialog
  include PageObject
  include DataMagic

  text_field :password, :id => "create_password_password"
  button :save_password_btn, :id => "create_password_create"

  def create_password_in_dialog(data = {})
    populate_page_with data_for(:new_user_popup, data)
    save_password_btn
  end
end
