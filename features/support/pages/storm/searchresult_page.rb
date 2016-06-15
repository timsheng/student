class SearchResultPage
  include PageObject
  include DataMagic

  button :wechat_short_banner, :css =>"span.filters div:nth-child(2)>button"

  def click_wechat_short_banner
    wechat_short_banner_element.fire_event :click
  end

end