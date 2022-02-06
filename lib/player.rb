require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'


class Player
attr_reader :name, :deck

  def initialize(player_name, deck)
    @name = player_name
    @deck = deck
  end

  def has_lost?

    if @deck.cards.length < 1
      true
    else
      false
    end

  end


end
