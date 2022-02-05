require './lib/deck'

class Player

  attr_reader :player_name, :deck

  def initialize(name, deck)
    @player_name = name
    @deck = deck

  end

  def player_name
    @player_name
  end

  def has_lost?

    if @deck.cards == []
      true
    else
      false
    end

  end


end
