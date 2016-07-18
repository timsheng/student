class SearchResultPage
  include PageObject
  include DataMagic

  svg :wechat_conversation_button, :class =>"wechat-conversation-button__icon"

  def click_wechat_conversation_button
    wechat_conversation_button_element.fire_event :click
  end
end
