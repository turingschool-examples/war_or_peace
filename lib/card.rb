# card class
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'







class Card
  attr_accessor :suit, :value, :rank, :start

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank

  end


  # def start
#     p "Welcome to War! (or Peace) This game will be played with 52 cards.
# The players today are #{player_1.name} and #{player_2.name}."
#     p "Type 'GO' to start the game!"
#   answer = gets.chomp
#
#   if answer == "GO"
#
#
#
  # end

end
