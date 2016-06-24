module FloatingWidget
  include PageObject

  div :left_floating_widget, :id => "wechat-widget"
  div :room_matrix_container, :id => "room-matrix-container"

  def click_left_floating_widget
    self.left_floating_widget_element.click
  end

  def click_left_floating_widget_pp
  	self.room_matrix_container_element.scroll_into_view
    self.left_floating_widget_element.when_present.click
  end

end
