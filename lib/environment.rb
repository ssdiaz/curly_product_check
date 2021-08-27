#require_relative './curly_product_check/version'
require_relative "curly_product_check/version"
require_relative "./curly_product_check/cli"

require 'pry'

module CurlyProductCheck
  class Error < StandardError; end
  # Your code goes here...
end
