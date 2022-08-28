# require '.pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

#100000000.times do      #to have it run for a few hours continuously to see if it'll break. Helped me find a couple of bugs.

game = Game.new.start


#end