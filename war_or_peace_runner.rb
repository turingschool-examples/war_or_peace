require './lib/card'
require './lib/deck' 
require './lib/player'
require './lib/turn'
require './lib/game' 
require './lib/card_generator'

game = Game.new 

puts game.display_welcome_message 
game.start