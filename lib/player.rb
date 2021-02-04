class Player
  attr_reader :name


  def initialize(name, deck)
    @name = name
    @has_lost = false
    @deck = deck
  end

  def has_lost?
    @has_lost = deck.cards.empty?
  end

  def deck
    @deck
  end

end
