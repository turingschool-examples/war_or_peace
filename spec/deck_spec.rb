require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  # let(:card1) {Card.new(:diamond, 'Queen', 12)}
  # let(:setup) {
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #
  #   cards = [card1, card2, card3]
  #
  #   deck = Deck.new(cards)
  # }
  it 'exists' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    #
    # deck = Deck.new(cards)
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has cards' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    #
    # deck = Deck.new(cards)
    expect(@deck.cards).to eq(@cards)
  end

  it 'has a rank value' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    #
    # deck = Deck.new(cards)

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'can separate high ranked cards' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    #
    # deck = Deck.new(cards)

    expect(@deck.high_ranking_cards).to eq([@card1, @card3])

  end


end
