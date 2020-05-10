require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'




@card1 = Card.new(:diamond, 'Queen', 12)
@card2 = Card.new(:spade, '3', 3)
@card3 = Card.new(:heart, 'Ace', 14)
@cards = [@card1, @card2, @card3]
@deck = Deck.new(@cards)

cards = []
standard_deck = Deck.new(cards)
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
  standard_deck.add_card(Card.new(:heart, rank, value))
end

rank_and_values.map do |rank, value|
  standard_deck.add_card(Card.new(:spade, rank, value))
end

rank_and_values.map do |rank, value|
  standard_deck.add_card(Card.new(:diamond, rank, value))
end

rank_and_values.map do |rank, value|
  standard_deck.add_card(Card.new(:club, rank, value))
end
