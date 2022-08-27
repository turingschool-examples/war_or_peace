require 'rspec'
require 'pry'
require './lib/deck'
require './card'

RSpec.describe Deck do
  before do
    @deck = Deck.new([Card.new(:foo, 'Bar', 9001)])
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has readable attributes' do
    expect(@deck.cards[0].suit).to eq(:foo)
    expect(@deck.cards[0].value).to eq('Bar')
    expect(@deck.cards[0].rank).to eq(9001)
  end

  it 'initializes empty array of cards by default' do
    deck = Deck.new
    expect(deck.cards).to_not be_nil
    expect(deck.cards.length).to eq(0)
  end

  it 'returns rank of card at given index' do
    expect(@deck.rank_of_card_at(0)).to eq(9001)
  end

  xit 'returns array of high ranking cards' do
    low_ranking_card = Card.new(:foo, 'Bar', 1)
    high_ranking_card = Card.new(:foo, 'Bar', 9001)
    deck = Deck.new([low_ranking_card, high_ranking_card])
    expect(deck.high_ranking_cards).to eq([high_ranking_card])
  end

  xit 'returns percentage of high ranking cards' do
    low_ranking_card = Card.new(:foo, 'Bar', 1)
    high_ranking_card = Card.new(:foo, 'Bar', 9001)
    deck = Deck.new([low_ranking_card, high_ranking_card, high_ranking_card])
    expect(deck.percentage_high_ranking).to eq(2.0/3.0)
  end

  xit 'removes card from top (beginning) of deck' do

  end

  xit 'adds card to bottom (end) of deck' do

  end

end
