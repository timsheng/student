class LoginPage
  include PageObject

  text_field :username, :id => "login_email"
  text_field :password, :id => "login_password"
  button :login_btn, :id => "login_login"
  link :signup_link, :href => "/signup"

  def login(username = FigNewton.storm.username, password = FigNewton.storm.password)
    self.username = username
    self.password = password
    login_btn
  end

end
