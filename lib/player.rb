class Player
  attr_accessor :deck, :has_lost
  attr_reader :name

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    @deck.cards.count.zero?
  end
end
