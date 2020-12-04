require './lib/game'

game = Game.new

puts """
Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{game.player1.name} and #{game.player2.name}.
Type 'GO' to start the game!
------------------------------------------------------------------
"""
until gets.chomp.upcase == 'GO'
  puts "Please type 'go' to start"
end

game.start
