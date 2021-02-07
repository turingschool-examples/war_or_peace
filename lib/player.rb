# require 'pry'
class Player
  attr_reader :cards, :name, :deck
  def initialize(name,deck)
    @name = name
    @deck = deck
    @cards = cards
  end

  def cards
    @deck.cards
  end

  def has_lost
      if @deck.cards.count > 0
        false
      else
        true
      end
  end
end
