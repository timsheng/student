$:.unshift File.expand_path('..',__FILE__)
require 'social_widget_module'
class HomePage
  include PageObject
  include SocialWidget

  page_url "#{FigNewton.storm.base_url}"

  link :login_link , :href => "/my-account/login"
  text_field :search_icon, :class => "search header-search"
  text_field :search_navigation, :css =>"div.search-wrapper>input.search"
  text_field :search_hero_banner, :css => "div.search-area>form.search-form>#s"
  unordered_list :search_result_for_city, :css => ".suggest-group.city"
  unordered_list :search_result_for_university, :css => ".suggest-group.university"
  unordered_list :search_result_for_property, :css => ".suggest-group.property"
  elements :popular_search_text,:a, :css => "form#form-search>div.search-possibilities li>a"
  link :partner_portal_link, :href => "/p/new-student"
  button :search_button_hero_banner, :css => "form#form-search button#search"
  div :left_floating_widget, :id => "wechat-widget"
  image  :popup_QRcode, :class => "wechat-qr-image"
  button :close_wechat_widget, :id => "start-conversation-close"

  def search_keywords_in_hero_banner keywords
    self.search_hero_banner = keywords
  end

  def search_keywords_in_navigation keywords
    self.search_navigation = keywords
  end

  def search_keywords_in_hero_banner_via_enter_keyboard
    self.search_button_hero_banner_element.send_keys :enter
  end

  def get_random_popular_element
    texts = []
    self.popular_search_text_elements.each do |element|
    texts << element
    end
    texts.sample
  end

  def click_left_floating_widget
    self.left_floating_widget_element.click
  end
end
