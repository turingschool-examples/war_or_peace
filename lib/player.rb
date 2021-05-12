require_relative 'card'
require_relative 'deck'

class Player
  attr_reader :name
  attr_accessor :deck, :has_lost

  def initialize(name='John', deck=Deck.new)
    @name = name.to_s
    if deck.class != Deck
      @deck = Deck.new
    else
      @deck = deck
    end
    @has_lost = false
  end

  def has_lost?()
    if self.deck.cards.length == 0
      self.has_lost = true
    end
    return self.has_lost
  end

end
