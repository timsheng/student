require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'
require_all 'lib'

# DataMagic.load('default1.yml')
# FigNewton.load('local.yml')

World(PageObject::PageFactory)
