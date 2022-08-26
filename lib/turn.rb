class Turn
  attr_reader :players, :deck
  def initialize(players, deck)
    @players = players
    @deck = deck
  end
end