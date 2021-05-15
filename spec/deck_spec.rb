require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "is an instance" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require 'pry'; binding.pry
    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq(cards)
  end

  it "will rank cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(1)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "shows high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "will give percentage" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end
end





    # expect(card1.suit).to eq(:diamond)
    # expect(card1.value).to eq('Queen')
    # expect(card1.rank).to eq(12)
  # end

  # it "is an instance of card2" do
  # card2 = Card.new(:spade, '3', 3)
  #
  #   expect(card2).to be_an_instance_of(Card)
  #
  #   expect(card2.suit).to eq(:spade)
  #   expect(card2.value).to eq('3')
  #   expect(card2.rank).to eq(3)
  # end
  #
  # it "is an instance of card3" do
  # card3 = Card.new(:heart, 'Ace', 14)
  #
  #   expect(card3).to be_an_instance_of(Card)
  #
  #   expect(card3.suit).to eq(:heart)
  #   expect(card3.value).to eq('Ace')
  #   expect(card3.rank).to eq(14)
  # end



#

# before :each do
