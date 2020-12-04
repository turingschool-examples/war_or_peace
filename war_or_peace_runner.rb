require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

suits = [:hearts, :diamonds, :spades, :clubs]

value_with_rank = {'2': 2, '3': 3, '4': 4,'5': 5, '6': 6, '7': 7,
'8': 8, '9': 9, '10': 10, 'Jack': 11, 'Queen': 12, 'King': 13,
'Ace': 14 }

cards = []

suits.map do |suit|
  value_with_rank.map do |value, rank|
    cards << Card.new(suit, value, rank)
  end
end

#p cards
