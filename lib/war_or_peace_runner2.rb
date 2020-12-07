require_relative "playgame"


puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
input = gets.chomp
if input == "GO"
  game = PlayGame.new
  game.start
else
  puts "Unrecognized input, please try again."
end
