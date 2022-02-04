require './deck'

class Player
  attr_reader :player_name, :deck
  def initialize(player_name, deck)
    @player_name = player_name
    @deck = deck
  end

end
