class SrpPage
  include PageObject
  include DataMagic

  button :wechat_short_banner, :xpath =>"//span[@class='filters']//div[2]/div[2]/button"

  def click_wechat_short_banner
    wechat_short_banner_element.fire_event :click
  end

end