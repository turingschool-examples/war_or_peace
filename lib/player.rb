class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards == []
      true
    else
      false
    end
  end
end

require './lib/card'
require './lib/deck'
card1 = Card.new(:diamond, 'Q', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'A', 14)
deck = Deck.new([card1, card2, card3])
player = Player.new('Clarisa', deck)

require "pry"; binding.pry
player2 = Player.new('sir', deck)
