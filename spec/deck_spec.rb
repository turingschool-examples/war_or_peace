require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  describe '#initialize' do
    it "exists" do
      # card1 = Card.new(:diamond, 'Queen', 12)
      # card2 = Card.new(:spade, '3', 3)
      # card3 = Card.new(:heart, 'Ace', 14)
      # cards = [card1, card2, card3]
      # deck = Deck.new(cards)
      expect(@deck).to be_an_instance_of(Deck)
    end
    it "has readable cards attribute" do
      expect(@deck.cards).to eq([@card1, @card2, @card3])
    end
    it "has readable cards with different cards" do
      @deck.remove_card
      expect(@deck.cards).to eq([@card2, @card3])
    end
  end

  describe '#rank_of_card_at' do
    it "can read card rank at given position" do
      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do
    it "can return high ranking cards" do
      expect(@deck.high_ranking_cards).to eq([@cards[0], @cards[2]])
    end
  end

  describe '#percent_high_ranking' do
    it "can determine percent of high ranking cards" do
      #rounding?
      expect(@deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do
    it "can remove top card" do
      # card1 = Card.new(:diamond, 'Queen', 12)
      # card2 = Card.new(:spade, '3', 3)
      # card3 = Card.new(:heart, 'Ace', 14)
      # cards = [card1, card2, card3]
      # deck = Deck.new(cards)
      # require 'pry'; binding.pry
      #why is this step removing from cards- not a copy
      # expect(deck.remove_card).to eq(cards[0])
      expect(@deck.remove_card).to eq(@card1)
    end
  end

  describe '#add_card' do
    it "can add card to bottom(end)" do
      @deck.remove_card
      card4 = Card.new(:club, '5', 5)
      @deck.add_card(card4)
      #deck.cards is the same as cards
      expect(@deck.cards).to eq([@card2, @card3, card4])
    end
  end
end
