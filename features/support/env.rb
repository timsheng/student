require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'fig_newton'
require 'require_all'


# DataMagic.load('default1.yml')
FigNewton.load('stage.yml')

World(PageObject::PageFactory)
