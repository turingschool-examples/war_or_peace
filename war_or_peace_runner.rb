require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# suits = [:heart, :spade, :diamond, :club]
standard_deck = []
rank_and_values = {
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '10': 10,
  'jack': 11,
  'queen': 12,
  'king': 13,
  'ace': 14
}

rank_and_values.map do |rank, value|
  standard_deck << Card.new(:heart, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck << Card.new(:spade, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck << Card.new(:diamond, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck << Card.new(:club, rank, value)
end
