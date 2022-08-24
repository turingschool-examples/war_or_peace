require "./card.rb"
require "./deck.rb"

class Player 
  attr_reader :name,
              :deck
              
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
end