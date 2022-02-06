class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.empty?
      true
    elsif deck.cards[2] == nil 
      true
    end
  end
end
