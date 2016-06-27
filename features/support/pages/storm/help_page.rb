class HelpPage
  include PageObject
  include DataMagic

  page_url "#{FigNewton.storm.base_url}/help"

  button :wechat_long_banner, :css =>"div.faq-content div:nth-child(2)>button"

  def click_wechat_long_banner
    self.wechat_long_banner
  end
end
