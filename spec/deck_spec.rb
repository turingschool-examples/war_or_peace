require 'rspec'
require './lib/deck'


RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    

    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq([card1, card2, card3])

  end

  it "can find a rank" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can find percent_high_ranking" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.high_ranking_cards
    deck.percent_high_ranking

    expect(deck.high_ranking_cards.size).to eq(2)
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.remove_card).to eq(card1)
    expect(deck.cards.size).to eq(2)
    deck.cards
    deck.high_ranking_cards
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  it "can add_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    expect(deck.cards.size).to eq(3)
    deck.high_ranking_cards
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
