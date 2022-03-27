require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'

puts "Who is player 1?"
p ">>>"
player1_name = gets.chomp
puts "Who is player 2?"
p">>>"
player2_name = gets.chomp
@player1 = Player.new(player1_name, @deck1)
@playeer = Player.new(player1_name, @deck2)
puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{player1_name} and #{player2_name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
p '>>>'
input = gets.chomp.upcase

if input == 'GO'
  game = Game.new(@player1, @player2)
  game.start
else
    puts "Fine, don't play my game."
end
