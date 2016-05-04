class PropertyPage
  include PageObject
  include Helper
  page_url "#{FigNewton.base_url}/uk/london/wbsa"

  FIRST_ENQUIRY_NOW = 0
  link :contact_an_expert, :class => "btn btn-link btn-secondary"
  elements :enquiry_now, :a, :css => ".btn.btn-primary-thin"

  def click_first_enquiry_now
    enquiry_now_elements[FIRST_ENQUIRY_NOW].click
  end

  def generate_page_url locale
    base_url = generate_base_url locale
    url = base_url+"/uk/london/wbsa"
  end

  def visit_specify_locale_property_page locale
    url = generate_page_url locale
    navigate_to url
  end
end
