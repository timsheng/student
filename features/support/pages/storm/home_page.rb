class HomePage
  include PageObject
  page_url "#{FigNewton.base_url}"

  link :login_link , :href => "/my-account/login"
end
