require './lib/start'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

start = Start.new
puts start.greeting
start.begin_game(gets.chomp)
