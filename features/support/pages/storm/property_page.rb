class PropertyPage
  FIRST_ENQUIRY_NOW = 1
  include PageObject
  page_url "#{FigNewton.base_url}/uk/london/wbsa"

  elements :enquiry_now, :a, :css => '.btn.btn-primary-thin'

  def click_first_enquiry_now
    enquiry_now_elements[FIRST_ENQUIRY_NOW].click
  end

end
