require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do 
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end
  describe "#initialize" do 
    it "exists" do
      expect(@deck).to be_a Deck
    end 
    it "has a readable attribute" do
      expect(@deck.cards).to eq [@card1, @card2, @card3]
    end 
  end 

  describe "#rank_of_card_at" do 
    it "returns the rank of a card for a given index" do 
      expect(@deck.rank_of_card_at(0)).to eq 12
      expect(@deck.rank_of_card_at(2)).to eq 14
    end
  end

  describe "#high_ranking_cards" do
    it "returns an array of the cards with a ranking above 11" do 
      expect(@deck.cards).to eq [@card1, @card2, @card3]
      expect(@deck.high_ranking_cards).to eq [@card1, @card3]
    end
    it "returns an accurate array after the hand has changed" do
      @deck.remove_card
      expect(@deck.high_ranking_cards).to eq [@card3]

      @card4 = Card.new(:club, "5", 5)
      @deck.add_card(@card4)
      expect(@deck.high_ranking_cards).to eq [@card3]
    end
  end

  describe "#percent_high_ranking" do 
    it "calculates the percentage of high ranking cards in the deck" do
      expect(@deck.percent_high_ranking).to eq 66.67
    end
    it "recalculates after the deck has been changed" do 
      @deck.remove_card
      expect(@deck.percent_high_ranking).to eq 50.0

      @card4 = Card.new(:club, "5", 5)
      @deck.add_card(@card4)
      expect(@deck.percent_high_ranking).to eq 33.33
    end 
  end

  describe "#remove_card" do 
    it "removes the 'top' card from the deck" do
      expect(@deck.cards).to eq [@card1, @card2, @card3]
      @deck.remove_card

      expect(@deck.cards).to eq [@card2, @card3]
    end
  end

  describe "#add_card" do 
    it "adds a card to the 'bottom' of the deck" do
      @card4 = Card.new(:club, "5", 5)
      @deck.add_card(@card4)

      expect(@deck.cards).to eq [@card1, @card2, @card3, @card4]
    end
  end
end 