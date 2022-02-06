#
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/create_deck'
require './lib/start'


p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."

p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"


starter = gets.chomp.upcase
if starter == "GO"
  game= Start.new
  game.start
else gets.chomp.upcase != "GO"
  return "Please Try Again!"
end
