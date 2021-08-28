require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    #require 'pry'; binding.pry
  end

  def add_card(card)
    @cards << card
# require 'pry';  binding.pry
  end
end
require 'pry'; binding.pry
