require 'deck.rb'
require 'card.rb'

class Player < Deck
  attr_reader :name , :deck

  def initialize(name, deck)
    @name = name
    @deck = deck.cards
  end
end
