require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'

RSpec.configure do |config|
	config.include PageObject::PageFactory

	config.before do
		@browser = Watir::Browser.new :firefox
	end

	config.after do
		@browser.close
	end
end