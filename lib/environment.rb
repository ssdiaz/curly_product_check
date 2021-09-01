#require_relative './curly_product_check/version'
require_relative "curly_product_check/version"
require_relative "./curly_product_check/cli"
require_relative "./curly_product_check/category"
require_relative "./curly_product_check/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri' #to look outside local files and into web

module CurlyProductCheck
  class Error < StandardError; end
  # Your code goes here...
end
