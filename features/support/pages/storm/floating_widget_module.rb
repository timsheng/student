module FloatingWidget
  include PageObject

  div :left_floating_widget, :id => "wechat-widget"
  div :close_wechat_widget_btn, :id => "start-conversation-close"

  def click_left_floating_widget
    self.left_floating_widget_element.when_visible.click
  end

  def close_wechat_widget
    self.close_wechat_widget_btn_element.click
  end
end
