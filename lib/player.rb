class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    #there has to be a better way. I couldn't get the follow two ideas to work
    # true if self.deck.cards == []
    #self.deck.cards == []
    if self.deck.cards == []
      true
    else false
    end
  end


end
