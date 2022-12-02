require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


game = Game.new
puts game.welcome_to_war
game.start_game(gets.chomp)
