
class Player
  attr_reader :deck
  def initialize(player_name, deck)
    @player_name = player_name
    @deck = deck
  end

  def player_name
    @player_name
  end

  def deck
    @deck
  end

  def has_lost?
    @deck.is_empty? == true
  end

end
