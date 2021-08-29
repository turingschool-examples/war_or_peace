puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Billy and Griffin."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

if gets.chomp == "GO"
  require './lib/game.rb'
  game1 = Game.new
  game1.start
else
  "Try typing 'GO'"
end
