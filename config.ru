# config.ru
require 'lotus'
require_relative 'application'

run ToDo::Application.new
