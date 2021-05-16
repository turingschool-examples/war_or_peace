require './lib/deck'
require './lib/card'
require 'rspec'

describe Deck do
 # test that initialize returns an array of cards
 it "exists" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace',14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)

   expect(deck).to be_an_instance_of(Deck)
 end

 # test that the attr_reader reads the @cards attribute
 # Perhaps that is not necessary? Was that tested above?

 # test that the rank_of_card_at method takes one argument at an index location
 # and returns the rank of the card
 it "cards have ranks" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace',14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)

   expect(deck.rank_of_card_at(2)).to eq(4)
 end

 # test that the percentage of high ranking cards is as expected within the deck
 # This should be approximately 23.1 percent for a whole real world deck...
 # I think... 52 cards, 12 high ranking cards
 # I think the deck class refers to the cards in hand, in this case.
 # That is confusing...
 it "percentage of ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace',14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)

  expect(deck.percent_high_ranking).to eq(66)
 end
 # test to ensure remove_card removes the top card from the deck
 it "removes card from the top of the deck" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace',14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)

  expect(deck.remove_card).to eq(card1)
 end
 # test ot ensure that add_card adds one card to he bottom aka end of the deck
 it "adds card to bottom of the deck" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace',14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)

   expect(deck.add_card(card1)).to eq([card2, card3, card1])
 end
end
