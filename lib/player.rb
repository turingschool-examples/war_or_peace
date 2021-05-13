require_relative 'card'
require_relative 'deck'

class Player
  attr_reader :name, :deck

  def initialize(name='John', deck=Deck.new)
    @name = name.to_s
    if deck.class != Deck
      @deck = Deck.new
    else
      @deck = deck
    end
  end

  def has_lost?()
    if self.deck.cards.length == 0
      return true
    else
      return false
    end
  end

end
