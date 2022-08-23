require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    
    expect(deck).to be_a(Deck)
  end

  it "has readable cards" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.card_list[1]).to eq(card_2)
  end

  it "has readable card attributes" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.card_list[1].value).to eq('Three')
  end

  it "can stack the deck" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.high_cards.length).to eq(0)
    deck.high_ranking_cards
    expect(deck.high_cards.length).to eq(2)
  end

  it "can determine % of high ranking cards" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove cards from deck" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.card_list.length).to eq(3)
    deck.remove_card
    expect(deck.card_list.length).to eq(2)
  end

  it "can add cards to deck" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.card_list.length).to eq(3)
    expect(deck.card_list[0]).to eq(card_1)
    deck.remove_card
    expect(deck.card_list.length).to eq(2)
    expect(deck.card_list[0]).to eq(card_2)
    deck.add_card(card_1)
    expect(deck.card_list.length).to eq(3)
    expect(deck.card_list[-1]).to eq(card_1)
  end
end
