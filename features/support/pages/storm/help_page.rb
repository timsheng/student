class HelpPage
  include PageObject
  include DataMagic
  
  page_url "#{FigNewton.storm.base_url}/help"

  button :wechat_long_banner, :xpath =>"//div[@class='faq-content']//nav/div[2]/div[2]/button"

end