class Player
attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.count > 1
      false
    end
  end
# in theory it makes sense to say we want this to be deck.cards.__ but where does
# it pull cards from?
end
