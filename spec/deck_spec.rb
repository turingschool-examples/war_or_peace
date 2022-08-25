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

  
  # xit 'returns percentage cards of high ranking card' do
  #   deck_1 = Deck.new(["card1", "card2"])
  #   deck_1.rank_of_card_at(0)
  # end 

end 