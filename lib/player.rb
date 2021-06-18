require_relative 'deck'

class Player
  attr_reader :name, :deck

  def initialize(name='John', deck=Deck.new)
    @name = name.to_s
    deck.class != Deck ? @deck = Deck.new : @deck = deck
  end

  def has_lost?
    deck.cards.length == 0
  end

end
