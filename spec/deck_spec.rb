require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond,'Queen', 12)
    card2 = Card.new(:spade,'3', 3)
    card3 = Card.new(:heart,'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq([card1, card2, card3])
  end

it 'determines rank of card at index position' do
  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade,'3', 3)
  card3 = Card.new(:heart,'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
expect(deck.rank_of_card_at(0)).to eq(12)
expect(deck.rank_of_card_at(2)).to eq(14)
end

it 'finds the percentage of high ranking cards' do
  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade,'3', 3)
  card3 = Card.new(:heart,'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
expect(deck.percent_high_ranking).to eq(66.67)
end

it "removes top card from cards array" do
  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade,'3', 3)
  card3 = Card.new(:heart,'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  expect(deck.remove_card).to eq(card1)
end

it "adds a card to the end of cards array(bottom of deck)" do
  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade,'3', 3)
  card3 = Card.new(:heart,'Ace', 14)
  card4 = Card.new(:club, '5', 5)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  expect(deck.add_card(card4)).to eq([card1, card2, card3, card4])
end
end
