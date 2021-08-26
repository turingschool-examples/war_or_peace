class Player
  attr_reader   :name,
                :deck,
                :cards

  def initialize(name, deck, cards)
    @name   = name
    @deck   = deck
    @cards  = cards
  end


end
