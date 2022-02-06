require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"


response = gets.chomp
if response.upcase == "GO"

  new_game = Game.new
  new_game.start
else puts "That's not how you start the game!"
end
