require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

standard_deck_cards = []
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
  standard_deck_cards << Card.new(:heart, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck_cards << Card.new(:spade, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck_cards << Card.new(:diamond, rank, value)
end

rank_and_values.map do |rank, value|
  standard_deck_cards << Card.new(:club, rank, value)
end

shuffled_standard_deck_cards = standard_deck_cards.shuffle

half_decks = standard_deck_cards.shuffle.each_slice((standard_deck_cards.size/2)).to_a
deck1 = Deck.new(half_decks[0])
deck2 = Deck.new(half_decks[1])

player1 = Player.new("Player 1", deck1)
player2 = Player.new("Player 2", deck2)

game = Game.new(player1, player2)

game.start
