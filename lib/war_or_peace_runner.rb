require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'

def create_deck
  suits = [:heart, :spade, :diamond, :club]
  deck = []
  suits.each do |suit|
    cards = [
        Card.new(suit, 'Ace', 14),
        Card.new(suit, 'King', 13),
        Card.new(suit, 'Queen', 12),
        Card.new(suit, 'Jack', 11),
        Card.new(suit, '10', 10),
        Card.new(suit, '9', 9),
        Card.new(suit, '8', 8),
        Card.new(suit, '7', 7),
        Card.new(suit, '6', 6),
        Card.new(suit, '5', 5),
        Card.new(suit, '4', 4),
        Card.new(suit, '3', 3),
        Card.new(suit, '2', 2)
    ]
    cards.each do |card|
      deck.push(card)
    end
  end
  deck
end

def split_deck_randomly(deck)
  half_deck = []
  (1..26).each do
    rand_card = deck.sample
    half_deck.push(rand_card)
    deck.delete(rand_card)
  end
  half_deck
end
