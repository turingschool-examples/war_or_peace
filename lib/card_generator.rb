require 'csv'
require_relative './card'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end
end
