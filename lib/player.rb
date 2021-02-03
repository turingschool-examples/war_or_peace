class Player
  attr_accessor :name, :deck, :has_lost
  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    if @deck.cards.empty?
      @has_lost = true
    end
    return @has_lost
  end
end
