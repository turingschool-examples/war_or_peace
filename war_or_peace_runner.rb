require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib.start'

#create an if/else within a loop to acquire correct input

while lets_go != 'GO'
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

lets_go = gets.chomp.to_s
  if lets_go == 'GO'
  else
    puts "Invalid input."
end

start
