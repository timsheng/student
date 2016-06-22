class PropertyPage
  include PageObject
  include Helper
  attr_reader :property_path
  page_url "#{FigNewton.storm.base_url}#{FigNewton.storm.property_path}"

  FIRST_ENQUIRY_NOW = 0

  link :contact_an_expert, :class => "contact-an-expert-cta__button btn btn-link btn-secondary"
  button :enquiry_now, :css => "form#room-preferences button"
  spans :room_card, :class => "room-category"
  span :choose_tenancy, :css => "div#picker label>span"
  labels :move_in_month, :css => "div#move-in-option-pills label"
  labels :move_out_month, :css => "div#move-out-option-pills label"


  def click_first_enquiry_now
    enquiry_now_elements[FIRST_ENQUIRY_NOW].click
  end

  def generate_page_url locale
    base_url = generate_base_url locale
    url = base_url + property_path
  end

  def property_path
    return "#{FigNewton.storm.property_path}"
  end

  def visit_specify_locale_property_page locale
    url = generate_page_url locale
    navigate_to url
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
       listing unless listing.style('color') == 'rgba(158, 158, 158, 1)'
    end
    final_listing = available_listings.sample
    if final_listing.nil?
      puts "no available listing"
    else
      final_listing.click
    end
  end

  def choose_required_tenancy
    self.choose_tenancy_element.click
    available_move_in_month = self.move_in_month_elements.select do |month|
      month unless month.style('background-color') != 'transparent'
    end
    final_move_in_month = available_move_in_month.sample
    if final_move_in_month.nil?
      puts "no available move in month"
    else
      final_move_in_month.click
    end
    available_move_out_month = self.move_out_month_elements.select do |month|
      month unless month.style('background-color') != 'transparent'
    end
    final_move_out_month = available_move_out_month.sample
    if final_move_out_month.nil?
      puts "no available move out month"
    else
      final_move_out_month.click
    end
  end

  def click_enquiry_now
    self.enquiry_now
  end
end
