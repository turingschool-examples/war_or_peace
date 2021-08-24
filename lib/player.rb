class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  #check if array of cards is empty
  def has_lost?
    @deck.cards.empty?
  end

end
