require './lib/deck'
require './lib/card'

RSpec.describe Deck do

  describe 'Object Creation' do

    before(:each) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @cards = [@card1, @card2, @card3]
      @deck = Deck.new(@cards)
    end

    it "exists" do
      expect(@deck).to be_an_instance_of(Deck)
    end

    it "has cards method" do
      expect(@deck.cards).to eq(@cards)
    end

  end

  describe 'Instance Methods' do

    before(:each) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @cards = [@card1, @card2, @card3]
      @deck = Deck.new(@cards)
    end

    it "has high_ranking_cards method" do
      # This method will return an array of cards in the deck that have a rank
      # of 11 or above (face cards and aces)
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end

    it "has rank_of_card_at method" do
      # This method will take one argument that represents the index location
      # of a card to be used and will return the rank of that card
      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
    end

    it "has percent_high_ranking method" do
      # This method will return the percentage of cards that are high ranking
      expect(@deck.percent_high_ranking).to eq(66.67)
    end

    it "has remove_card method" do
      # This method will remove the top card from the deck
      expect(@deck.remove_card).to eq(@card1)
      expect(@deck.cards).to eq([@card2, @card3])
    end

    it "has add_card method" do
      # This method will add one card to the bottom (end) of the deck
      @card4 = Card.new(:club, '5', 5)
      @deck.add_card(@card4)

      expect(@deck.cards).to eq([@card1, @card2, @card3, @card4])
    end

  end

end
