class HomePage
  include PageObject
  page_url "#{FigNewton.base_url}"

  link :login_link , :href => "/my-account/login"
  text_field :search_icon, :class => "search header-search"
  text_field :search_navigation, :css =>"div.search-wrapper>input.search"

  text_field :search_hero_banner, :css => "div.search-area>form.search-form>#s"

  unordered_list :search_result_for_city, :css => ".suggest-group.city"
  unordered_list :search_result_for_university, :css => ".suggest-group.university"
  unordered_list :search_result_for_property, :css => ".suggest-group.property"

  def search_keywords_in_hero_banner keywords
    self.search_hero_banner = keywords
  end

  def search_keywords_in_navigation keywords
    self.search_navigation = keywords
  end
end
