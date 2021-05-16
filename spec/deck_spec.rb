require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "can add cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = []
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    deck.add_card(card4)

    expect(deck.cards).to eq([card1, card2, card3,card4])
  end


  it "can call rank_of_card_at" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = []
    deck = Deck.new(cards)

    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)

   expect(deck.rank_of_card_at(0)).to eq(12)
   expect(deck.rank_of_card_at(2)).to eq(14)
 end

 it "can have high_ranking_cards" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = []
   deck = Deck.new(cards)

   deck.add_card(card1)
   deck.add_card(card2)
   deck.add_card(card3)

  expect(deck.high_ranking_cards).to eq([card1, card3])
 end

 it "can call percent_high_ranking" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)

   expect(deck.percent_high_ranking). to eq(66.67)
 end

 it "can remove_card" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)

   deck.remove_card

   expect(deck.cards).to eq([card2, card3])

 end
end
