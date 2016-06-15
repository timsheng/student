class PropertyPage
  include PageObject
  include Helper
  attr_reader :property_path
  page_url "#{FigNewton.storm.base_url}#{FigNewton.storm.property_path}"

  FIRST_ENQUIRY_NOW = 0

  link :contact_an_expert, :class => "contact-an-expert-cta__button btn btn-link btn-secondary"
  elements :enquiry_now, :a, :css => ".btn.btn-primary-thin"
  spans :room_card, :class => "room-category"

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
        final_room_category.click
        sleep 5
      end
  end

  def choose_available_listing
    puts choose_available_room_category
  end

  def click_enquiry_now
  end
end
