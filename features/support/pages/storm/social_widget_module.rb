module SocialWidget
  include PageObject

  WECHAT_SIDEBAR_ICON = 3 unless const_defined?(:WECHAT_SIDEBAR_ICON)
  unordered_list :social_widget, :id=>"contact-sidebar-list"
  button :wechat_social_widget, :class =>"wechat-conversation-banner__button-start-conversation"

  def click_wechat_sidebar_icon
    self.social_widget_element[WECHAT_SIDEBAR_ICON].click
  end

  def click_wechat_social_widget
    self.wechat_social_widget
  end
  
end