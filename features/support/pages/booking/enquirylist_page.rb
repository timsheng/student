class EnquiryListPage
  include PageObject
  page_url "#{FigNewton.booking.base_url}/booking/admin/enquiry/list"

  # cell :existing_user, :text => ""

  def enquiry_need_to_be_lost_by name
     link_element(:text =>"#{cell_element(:class => "#{cell_element(:text => name).class_name}").text}").click
  end

end
