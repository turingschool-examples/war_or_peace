require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
it "exists" do
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
  deck = Deck.new(cards)
expect(deck).to be_a(Deck)
end
it "has cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq([card1, card2, card3])
end
 it "finds rank of card at given index" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
     deck = Deck.new(cards)
     expect(deck.rank_of_card_at(0)).to eq(12)
     expect(deck.rank_of_card_at(0)).to eq(14)
 end
end
