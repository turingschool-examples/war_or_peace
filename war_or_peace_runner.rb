require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

suits = [:hearts, :diamonds, :spades, :clubs]

value_with_rank = { '2': 2, '3': 3, '4': 4,'5': 5, '6': 6, '7': 7,
'8': 8, '9': 9, '10': 10, 'Jack': 11, 'Queen': 12, 'King': 13,
'Ace': 14 }

cards = []

suits.map do |suit|
  value_with_rank.map do |value, rank|
    cards << Card.new(suit, value, rank)
  end
end

#p cards

cards.shuffle!

deck1 = cards.shift(26)
deck2 = cards.shift(26)

player1 = Player.new("Dwight", deck1)
player2 = Player.new("Jim", deck2)

p player1
p player1.deck.count
p player2
p player2.deck.count
