class Player
attr_accessor :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck

  end

  def has_lost?
    @deck.cards.size == 0
  end


end
