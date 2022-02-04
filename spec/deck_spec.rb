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

  it 'deck class exists' do
  # card1 = Card.new(:diamond, 'Queen', 12)
  # card2 = Card.new(:spade, '3', 3)
  # card3 = Card.new(:heart, 'Ace', 14)
  # cards = [card1, card2, card3]
  # deck = Deck.new(cards)
  @deck.cards
  expect(@deck).to be_an_instance_of(Deck)
  end

  it 'rank of card at certain index' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'returns high rank cards' do #return 11 and above
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'returns percent high ranking cards at 66.67 percent' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    expect(@deck.percent_high_ranking).to eq(66.67)
  end


  it 'can remove a card from the top of the deck' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    expect(@deck.remove_card).to eq(@card1)
    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50.0)
  end

  it 'can remove a card from the top of the deck' do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    @deck.remove_card
    @deck.add_card(card4)
    expect(@deck.cards).to eq([@card2, @card3, card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end
