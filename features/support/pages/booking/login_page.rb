module Booking
  class LoginPage
    include PageObject
    page_url FigNewton.booking.base_url

    # DEFAULT_DATA = {
    #   'username' => 'tim.sheng',
    #   'password' => '111111'
    # }

    text_field :username, :id => 'username'
    text_field :password, :id => 'password'
    button :login_btn, :id => '_submit'

    def login(username = FigNewton.booking.username, password = FigNewton.booking.password)
      self.username = username
      self.password = password
      login_btn
    end

  end
end
