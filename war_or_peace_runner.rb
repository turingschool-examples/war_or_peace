require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/start'

def create_deck
  suits = ['Diamond', 'Spade', 'Club', 'Heart']
  values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
  ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14]

require "pry"; binding.pry

  #The struggle is real. I can't seem to map the suits to each value then
  #map that to each rank.
  suits.map {|suit| values}
    Card.new(@suit, value, rank)
    # values[0..-1]
    # rank[0..-1]
  # end

    # Card.new(suit, value, rank)


  # deck = values.flat_map {|value| ranks.map {|rank| Card.new(:Diamond, value, rank)}}

end
create_deck
