class Player
  attr_reader :name, :deck, :spoils_of_war

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # The array of cards is an attribute of a Deck and
    # is initialized with a Deck.
    # Access array of cards of a Deck with @deck.cards .
    # 
    @deck.cards.count == 0
  end
end
