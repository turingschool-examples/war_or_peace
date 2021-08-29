require './lib/card'
require './lib/deck'

class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards == []
  end

  def rank_of_card_at(index)
    deck.rank_of_card_at(index)
  end

  def remove_card
    deck.cards.shift
    #@deck -= @deck[0]
  end
end
