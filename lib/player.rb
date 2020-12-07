class Player
  attr_reader :name,
              :deck,
              :has_lost
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost
    @deck.empty?
  end
end
