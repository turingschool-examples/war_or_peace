class Player
  attr_reader  :name,
               :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    deck.cards.empty?
    # @lost = true if @deck.cards.empty? == true
    # @lost
  end
end
