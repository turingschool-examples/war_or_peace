#!/Users/johnhennerich/.rbenv/shims/ruby
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

game = Game.new
game.welcome_banner
start = game.user_input
#binding.pry
if start == true
game.start
end
