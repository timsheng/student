require 'watir-webdriver'



Before do |scenario|
  @browser = Watir::Browser.new :ff
  @browser.window.maximize
end


After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    filename = "error-#{@current_page.class}-#{time}.png"
    @current_page.save_screenshot(filename)
    embed(filename, 'image/png')
  end
    @browser.close
end





# After do |s|
#   # Tell Cucumber to quit after this scenario is done - if it failed.
#   Cucumber.wants_to_quit = true if s.failed?
# end
