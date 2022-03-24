require 'pry'
require './lib/card'
require './lib/deck'

class Player
  attr_reader :card,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end


end
