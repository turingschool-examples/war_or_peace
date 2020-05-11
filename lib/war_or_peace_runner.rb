require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

print 'Player 1: '
first_player = gets.chomp.capitalize
print 'Player 2: '
second_player = gets.chomp.capitalize

game = Game.new( first_player, second_player )

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are #{first_player} and #{second_player}."
puts "Type 'GO' to start the game!"
puts '___'*25
puts "\n\n"

go = gets.chomp.upcase

if go == 'GO'
  game.start
else
  p "Sorry, you shall not pass with #{go}"
end
