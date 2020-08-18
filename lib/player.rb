class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @player_lost = false
  end

  def has_lost?
    if @deck.cards.empty?
      @player_lost = true
      return @player_lost
    end
    @player_lost
  end
end
