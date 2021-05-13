require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before 'tests' do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_a(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it 'checks rank of cards' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'checks for high ranking cards' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'gives percentage of high ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it 'removes first card from deck' do
    expect(@deck.remove_card).to eq(@card1)
    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50.0)
  end

  it 'adds a card to deck' do
    @deck.remove_card
    card4 = Card.new(:club, '5', 5)
    @deck.add_card(card4)

    expect(card4).to be_a(Card)
    expect(@deck.cards).to eq([@card2, @card3, card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end
