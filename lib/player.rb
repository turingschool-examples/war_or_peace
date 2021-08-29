class Player
  attr_reader :name, :deck, :game_lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @game_lost = false
    
  end

  def has_lost?
    if deck.cards.count == 0
      @game_lost = true
    else @game_lost
    end
  end
end
