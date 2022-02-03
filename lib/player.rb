require './lib/deck.rb'
require './lib/card.rb'

class Player
  attr_reader :name, :deck
  def initialize(player_name, player_deck)
    @name = player_name
    @deck = player_deck
  end

  def has_lost?
    @deck.cards == []
  end
end
