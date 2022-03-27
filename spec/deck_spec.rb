require 'rspec'
require './lib/card'
require './lib/deck'

Rspec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
#These variables reload before each test so I don't have to retype them
  end

  it 'exists' do

    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has cards' do

    expect(@deck.cards).to eq(@cards)
  end
  describe '#rank_of_card_at' do
    it 'has a rank value' do

      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do
    it 'can separate high ranked cards' do

      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end
  end

  describe '#remove_card' do
    it 'can remove top card' do

      expect(@deck.remove_card).to eq(@card1)
      expect(@deck.cards).to eq([@card2, @card3])
      expect(@deck.high_ranking_cards).to eq([@card3])
    end
  end

  describe '#add_card' do
    it 'can add cards to deck' do
      @deck.remove_card
      card4 = Card.new(:club, '5', 5)

      expect(@deck.add_card(card4)).to eq([@card2, @card3, card4])
    end
  end
  describe '#percent_high_ranking' do
    it 'shows what percentage of a deck is high rank' do


      expect(@deck.percent_high_ranking).to eq(66.67)
       @deck.remove_card

      expect(@deck.percent_high_ranking).to eq(50.00)
       card4 = Card.new(:club, '5', 5)
       @deck.add_card(card4)

      expect(@deck.percent_high_ranking).to eq(33.33)
    end
  end
end
