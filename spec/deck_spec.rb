require 'rspec'
require 'card.rb'
require 'deck.rb'

RSpec.describe Deck do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)
    expect(deck).to be_an_instance_of(Deck)
  end

it "can have a deck of multiple cards" do
  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)
  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
 end

 it "can call rank" do
  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
  expect(deck.rank_of_card_at(0)).to eq (12)
  expect(deck.rank_of_card_at(2)).to eq (14)
 end

it "can check for high ranking cards" do

  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)

  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
end

it "can check for the percentage of high ranking cards" do
  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
  expect(deck.percentage_high_ranking).to eq(67.0)
end

it "can add a card(s) to the deck" do
  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)
  card_4 = Card.new(:club, '5', 5)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
  expect(deck.percentage_high_ranking).to eq(67.0)

  deck.add_card(card_4)

  expect(deck.cards).to eq([card_1, card_2, card_3, card_4])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
  expect(deck.percentage_high_ranking).to eq(50.0)
 end

it "can remove a card(s) to the deck" do
  card_1 = Card.new(:diamond, 'Queen', 12)
  card_2 = Card.new(:spade, '3', 3)
  card_3 = Card.new(:heart, 'Ace', 14)
  card_4 = Card.new(:club, '5', 5)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  expect(deck.cards).to eq([card_1, card_2, card_3])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
  expect(deck.percentage_high_ranking).to eq(67.0)

  deck.add_card(card_4)

  expect(deck.cards).to eq([card_1, card_2, card_3, card_4])
  expect(deck.high_ranking_cards).to eq([card_1, card_3])
  expect(deck.percentage_high_ranking).to eq(50.0)

  deck.remove_card

  expect(deck.cards).to eq([card_2, card_3, card_4])
  expect(deck.high_ranking_cards.count).to eq(1)
  expect(deck.high_ranking_cards).to eq([card_3])
  expect(deck.percentage_high_ranking).to eq(33.0)
end
end
