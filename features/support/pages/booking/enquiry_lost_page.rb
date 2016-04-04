class EnquiryLostPage
  include PageObject

  link :select_reason, :class => "select2-choice"
  select_list :lost_reason, :id => "lost_reason"
  text_area :note, :id => "lost_note"
  button :change_to_lost_btn, :id => "lost_save"

  def change_to_lost
    self.select_reason
    self.lost_reason = "Test enquiry"
    self.note = "Test note"
    self.change_to_lost_btn
  end

end
