require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'fig_newton'
require 'require_all'
require_relative 'common'
# require 'rack'

# DataMagic.load('default1.yml')
# FigNewton.load('stage_draft.yml')

World(PageObject::PageFactory)
# World(Helper)

# PageObject.default_page_wait = 20
# PageObject.default_element_wait = 5
# PageObject.javascript_framework = :angularjs

# World(Rack::Test::Methods)
