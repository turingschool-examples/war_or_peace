#!/Users/johnhennerich/.rbenv/shims/ruby
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

game = Game.new
game.welcome_banner

start = game.user_input

if start == "GO"
  game.make_deck("normal")
  game.start

elsif start == "1"
  game.make_deck("file")
  game.start

end
