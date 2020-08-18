require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


card_values = %w(2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace)
card_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
card_hash = card_values.zip(card_ranks).to_h
suits = %i(hearts, clubs, diamonds, spaids)
full_deck = []

#create standard deck of 52 cards
suits.each do |suit|
  card_hash.each do |value,rank|
    full_deck << Card.new(suit,value,rank)
  end
end

#shuffle the cards
full_deck.shuffle!

#divide the deck into equal decks
deck1 = full_deck.shift(26)
deck2 = full_deck

p deck1.size
p deck2.size
