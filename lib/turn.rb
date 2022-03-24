class Turn
  require 'rspec'
  require './lib/card'
  require './lib/deck'
  require './lib/player'
  require 'pry'
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
end
