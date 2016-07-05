class EnquiryListPage
  include Helper
  include PageObject

  page_url "#{FigNewton.booking.base_url}/booking/admin/enquiry/list"
  list_item :unassigned_tab, :id => "tab-unassigned"

  def enquiry_need_to_be_lost_by name
    link_element(:text =>"#{cell_element(:class => "#{cell_element(:text => name).class_name}").text}").click
  end

  def switch_to_unassigned_tab
  	unassigned_tab_element.click
  end	
end