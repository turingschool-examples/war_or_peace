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
    # require 'pry'; binding.pry
  end

  it "has readable attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.cards).to eq([card1, card2, card3])
    # require 'pry'; binding.pry
  end

  it "returns rank of card at" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
    #require 'pry'; binding.pry
  end
  it "checks percentage of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
    # require 'pry'; binding.pry
  end

  it "returns the percentage of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
    # require 'pry'; binding.pry
  end

  it "removes the first card in the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])

    # require 'pry'; binding.pry
  end

  it "adds a card to the end of the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    # require 'pry'; binding.pry
    expect(deck.add_card(card4)).to eq(deck.cards[-1])
    expect(deck.cards.count).to eq(4)
    # require 'pry'; binding.pry
  end

end
