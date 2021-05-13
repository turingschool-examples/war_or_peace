require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

  end

  it 'has a deck' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has attr_reader' do
    expect(@deck.cards).to eq(@cards)
  end

  it 'shows rank of card' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'show high ranking cards' do
    expect(@deck.high_ranking_cards).to eq(@card1, @card3)
  end

  # xit 'removes card' do
  #
  #   @deck =
  #   expect(deck.remove_card).to ??????
  # end
  #
  # xit 'adds a card' do
  #   expect(deck.add_card).to ??????
  # end

end
