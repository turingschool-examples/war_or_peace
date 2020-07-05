class Player
  attr_reader :deck, :name

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?

    if @deck.cards.length > 0
      return @lost
    end
    if @deck.cards.length == 0
      return true
    end


  end


end
