require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do

  it "can get a bunch of cards from Card class to make a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])

  end

  it "can find the rank of a card at index" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_cards_at(0)).to eq(12)
    expect(deck.rank_of_cards_at(2)).to eq(14)
  end

  it "can return an array of high ranking cards" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])

  end


  it "can find percentage of high ranking cards" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)

  end

  it "can remove the top card from the deck" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    expect(deck.cards).to eq([card2, card3])
  end

  it "can add a card to the bottom of the deck" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    expect(deck.cards).to eq([card1, card2, card3, card4])

  end

#need to put in test for percent_high_ranking after cards were subtracted or added

end
