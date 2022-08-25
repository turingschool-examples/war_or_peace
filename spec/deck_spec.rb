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
    
    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable cards" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.card_list).to eq(cards)
  end

  # Maybe drop later already tested in card_spec
  it "has readable card attributes" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can check if a card in the deck is >= 11" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card_1, card_3])
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

    expect(deck.remove_card).to eq(card_1)
    expect(deck.card_list).to eq([card_2, card_3])
    expect(deck.high_ranking_cards).to eq([card_3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  # Still not happy with this test. deck.add_card(card_4) should be in the expect()
  # Also, the Interaction doc is a bit confusing on how this test should run
  # it seems to think that the card removed from the deck from the previous step
  # is still removed
  it "can add cards to deck" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    card_4 = Card.new(:club, 'Five', 5)
    expect(deck.card_list).to eq(cards)
    deck.remove_card
    deck.add_card(card_4)
  
    expect(deck.card_list).to eq([card_2, card_3, card_4])
    expect(deck.high_ranking_cards).to eq([card_3])
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
