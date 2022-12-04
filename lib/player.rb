class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.empty?
      true
    else
      false
    end
    #better solution @deck.cards.empty?
  end
end