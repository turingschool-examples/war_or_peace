class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?(player)
    player.deck.cards.empty?
  end
  
end
