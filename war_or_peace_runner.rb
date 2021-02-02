require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

standard_deck = []
suits = [:spades, :hearts, :diamonds, :clubs]
ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
suits.each do |suit|
  ranks.size.times do |i|
    standard_deck << Card.new(suit, ranks[i], i+1)
  end
end

p standard_deck
