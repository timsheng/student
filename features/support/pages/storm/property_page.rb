$:.unshift File.expand_path('..',__FILE__)
require 'floating_widget_module'

class PropertyPage
  include PageObject
  include Helper
  include FloatingWidget
  attr_reader :property_path

  page_url "#{FigNewton.storm.base_url}#{FigNewton.storm.property_path}"

  FIRST_ENQUIRY_NOW = 0

  button :contact_an_expert, :class => "contact-an-expert-cta__button btn btn-link btn-secondary"
  div :wechat_short_banner, :class =>"wechat-button-wrapper"
  button :enquiry_now, :css => "form#room-preferences button"
  spans :room_card, :class => "room-category"
  span :choose_tenancy, :css => "div#picker label>span"
  div :room_matrix_container, :id => "room-matrix-container"
  labels :move_in_month, :css => "#move-in-option-pills>div>input[type='radio']:not(:disabled)+label"
  labels :move_out_month, :css => "#move-out-option-pills>div>input[type='radio']:not(:disabled)+label"

  def click_first_enquiry_now
    enquiry_now_elements[FIRST_ENQUIRY_NOW].click
  end

  def click_left_floating_widget_pp
    self.room_matrix_container_element.scroll_into_view
    2.times do
      self.click_left_floating_widget
    end
  end

  def click_wechat_short_banner_right
    wechat_short_banner_element.when_present.click
  end

  def property_path
    return "#{FigNewton.storm.property_path}"
  end

  def visit_specify_locale_property_page locale
    visit_specify_locale_page locale, property_path
  end

  def choose_available_room_category
    available_room_cards = room_card_elements.select do |room_card|
      room_card unless room_card.style('cursor') == 'default'
    end
    final_room_category = available_room_cards.sample
    if final_room_category.nil?
      puts "no available room category"
    else
      final_room_category
    end
  end

  def choose_corresponding_listing room_category
    parent_div = room_category.parent.parent
    sibling_ul = parent_div.ul(:xpath, "./following-sibling::ul")
    all_listings = sibling_ul.lis
    new_listings = all_listings[0...all_listings.size-1]
    available_listings = new_listings.select do |nl|
       listing = nl.div(:class, "property-rooms-unit-content__information")
       listing if (listing.style('color') != 'rgba(158, 158, 158, 1)' && listing.visible?)
    end
    final_listing = available_listings.sample
    if final_listing.nil?
      puts "no available listing"
    else
      final_listing.when_present.click
    end
  end

  def choose_required_tenancy
    self.choose_tenancy_element.click
    choose_available_move_in_month
    choose_available_move_out_month
  end

  def choose_available_move_in_month
    available_move_in_month = self.move_in_month_elements.sample
    available_move_in_month.when_present.click
  end

  def choose_available_move_out_month
    available_move_out_month = self.move_out_month_elements.sample
    available_move_out_month.when_present.click
  end

  def click_enquiry_now
    self.enquiry_now
  end
end
