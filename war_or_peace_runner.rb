#
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/create_deck'
require './lib/start'

# require_relative './lib/card'
# require_relative './lib/deck'
# require_relative './lib/player'
# require_relative './lib/turn'
# require_relative './lib/create_deck'
# require_relative './lib/start'


p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"

# game= Start.new
# game.start
# require 'pry'; binding.pry



starter = gets.chomp.upcase
if starter == "GO"

  game= Start.new


  game.start
  # require 'pry'; binding.pry

else
  return "Please Try Again!"
end
#
require 'pry'; binding.pry

# start method
# creates deck
# shuffles deck
# puts into 2 player decks
# creates players
