require 'rspec'
require './lib/card'
require './lib/deck'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, '5', 5)
cards = [card1, card2, card3]
deck = Deck.new(cards)

RSpec.describe Deck do
  it "puts cards in array" do
    expect(deck.cards).to eq(cards)
  end

  it 'can find rank of card at' do
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it 'cards rank 11 and up' do
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it 'percent high ranking' do
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove card' do
    expect(deck.remove_card).to eq(card1)
  end

  it 'can add card' do
    expect{deck.add_card(card4)}.to change{cards.count}.by(1)
  end

end
