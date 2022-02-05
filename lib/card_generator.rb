require './lib/card'
require 'pry'

class CardGenerator
  attr_accessor :cards
  
  def initialize(filename)
    @cards = []
    card_count = 0
  end

end


binding.pry
