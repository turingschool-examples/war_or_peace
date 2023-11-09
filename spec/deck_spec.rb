require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "can have cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = (cards) 

    expect(deck).to eq(cards)
  end

    it #rank_of_card_at do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = (cards) 

    expect(deck.rank_of_card_at(0)).to eq 0
    expect(deck.rank_of_card_at(2)).to eq 14
    end


 