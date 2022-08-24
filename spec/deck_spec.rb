require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
 it "exists" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)
   deck.add_to_deck(card1)
   deck.add_to_deck(card2)
   deck.add_to_deck(card3)
   expect(deck).to be_an_instance_of(Deck)
   expect(deck.cards).to eq([card1, card2, card3])
   end

   #it "adds to deck" do
     # card1 = Card.new(:diamond, 'Queen', 12)
     # card2 = Card.new(:spade, '3', 3)
     # card3 = Card.new(:heart, 'Ace', 14)
     #
     # cards = [card1, card2, card3]
     #
     # card1.add_to_deck(card1)
     # card2.add_to_deck(card2)
     # card3.add_to_deck(card3)
   end
