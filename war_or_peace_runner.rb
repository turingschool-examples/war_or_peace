require './lib/game'

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts "Please enter Player 1's name"
print '>'
player1_name = gets.chomp
puts "Please enter Player 2's name"
print '>'
player2_name = gets.chomp
puts "The players today are #{player1_name} and #{player2_name}."
magic_word = 'GO'
user_input = nil

until magic_word == user_input
  puts "Type 'GO' to start the game!"
  print '>'
  user_input = gets.chomp.upcase
end

game = Game.new(player1_name, player2_name)
game.start
