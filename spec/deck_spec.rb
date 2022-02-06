require 'rspec'
require './lib/card'
require './lib/deck'
# ADD MORE TESTS BEFORE THIS FIRST ONE TO TEST MORE ENTRIES IN THE ITERATION PATTERN
# I added the tests below this one, Sometimes I gloss over parts of the directions -sorry

RSpec.describe Deck do
  it "deck.cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    expect(deck.cards).to eq([card1, card2, card3])
  end
  it "Deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    expect(deck).to be_an_instance_of(Deck)
  end
  it "rank of card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.rank_of_card_at(0)
    deck.rank_of_card_at(2)
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end
  it "high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.high_ranking_cards
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end
  it "percent_high_ranking" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.high_ranking_cards
    deck.percent_high_ranking
    expect(deck.percent_high_ranking).to eq(66.67)
  end
  it "remove_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    deck.cards
    expect(deck.cards).to eq([card2, card3])
  end
  it "recheck high_ranking_cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    deck.cards
    deck.high_ranking_cards
    expect(deck.high_ranking_cards).to eq([card3])
  end
  it "recheck percent_high_ranking" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    deck.percent_high_ranking
    expect(deck.percent_high_ranking).to eq(50.0)
  end
  it "check add_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    deck.cards
    expect(deck.cards).to eq([card2, card3, card4])
  end
  it "third check high_ranking_cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    deck.cards
    deck.high_ranking_cards

    expect(deck.high_ranking_cards).to eq([card3])
  end
  it "third check percent_high_ranking" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    deck.cards
    deck.percent_high_ranking

    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
