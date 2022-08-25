require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do 
  before (:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
  end
  describe '#initialize' do 
    it 'is an instance of deck' do 
      deck_1 = Deck.new(@cards)
      expect(deck_1).to be_instance_of Deck
    end 

    it 'has cards' do 
      deck_1 = Deck.new(@cards)
      expect(deck_1.cards).to eq([@card1, @card2, @card3]) 
    end 
  end 

  describe '#rank_of_card_at' do 
    it 'returns the rank of that card' do 
      deck_1 = Deck.new(@cards)
      
      expect(deck_1.rank_of_card_at(0)).to eq(12)
      expect(deck_1.rank_of_card_at(2)).to eq(14)
    end      
  end 

  describe '#high_ranking_card' do
    it 'returns an array of high ranking cards' do 
      deck_1 = Deck.new(@cards)
      
      expect(deck_1.high_ranking_card).to eq([@card1, @card3])
    end 
  end 

  describe '#percent_high_ranking' do 
    it 'returns percentage of high ranking card' do
      deck_1 = Deck.new(@cards)
      
      expect(deck_1.percent_high_ranking).to eq(66)
    end 
  end 

  describe '#remove_card' do 
    it 'removes the top card from the deck' do 
      deck_1 = Deck.new(@cards)

      expect(deck_1.remove_card).to eq(@card1)
    end 
  end 

  describe '#add_card' do 
    it 'adds one card to the bottom of the deck' do 
      deck_1 = Deck.new(@cards)
      @card4 = Card.new(:club, '5', 5)
      
      deck_1.add_card(@card4)
      expect(deck_1.cards).to eq([@card1, @card2, @card3, @card4])
    end
  end 
end 