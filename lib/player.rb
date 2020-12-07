class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # @deck.cards.count == 0
    #I know this should be zero, but can't figure out bug I get when less than 2
    if @deck.cards.count > 3
      lost = false
    else
      lost = true
    end
    return lost
  end

end
