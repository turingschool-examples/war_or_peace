require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Player
attr_reader :name, :deck, :player

  def initialize(name, deck)
    @name = name
    @deck = deck
    @player = player
  end

  def has_lost?
    if @deck.cards == []
      true
    else
      false
    end
  end

end
