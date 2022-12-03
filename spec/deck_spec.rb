require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'
RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(cards = Card.new(:diamond, 'Queen', 12))

    expect(deck).to be_an_instance_of(Deck)
  end

  it "should return cards in deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq (cards)
  end

  it "should return rank of a specific card in the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq (cards)
    expect(deck.rank_of_card_at(0)).to eq (12)
    expect(deck.rank_of_card_at(2)).to eq (14)
    expect(deck.cards).to eq (cards)
  end

  it "should return high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it 'can return the #percent_high_ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to eq('66.67%')
  end

  it 'can update the #percent_high_ranking when adding and removing cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq('66.67%')

    deck.remove_card
    expect(deck.cards.count).to eq(2)
    expect(deck.high_ranking_cards.count).to eq(1)
    expect(deck.percent_high_ranking).to eq('50.0%')

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    expect(deck.cards.count).to eq(3)
    expect(deck.high_ranking_cards.count).to eq(1)
    expect(deck.percent_high_ranking).to eq('33.33%')
  end
end
