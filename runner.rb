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

loop do
  game.take_turn

  if game.player1.has_lost? == true
    p "*~*~*~* #{game.player2.name} has won the game! *~*~*~*"
    break
  elsif game.player2.has_lost? == true
    p "*~*~*~* #{game.player1.name} has won the game! *~*~*~*"
    break
  elsif game.round_count == 1000000
    p "---- DRAW ----"
    break
  else
  end
end
