require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    expect(@card3).to be_an_instance_of(Card)
  end
  
  describe 'Iteration 1' do
    it '1. Build a deck' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end
    it '2. Gives rank of card' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
    it '3. Returns high ranking cards' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards
      
      expect(deck.high_cards).to eq([@card1, @card3])
    end
    it '4. Gives percentage of high cards in deck' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards
      
      expect(deck.percent_high_ranking).to eq(66.67)      
    end
    it '5. Removes top card from deck' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)

      deck.remove_card
      deck.high_ranking_cards

      
      expect(deck.cards).to eq([@card2, @card3])
      expect(deck.high_cards).to eq([@card3])
      expect(deck.percent_high_ranking).to eq(50.00)
    end
    
    it '6. Adds a new card to the deck' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      deck.remove_card
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      deck.high_ranking_cards
            
      expect(deck.cards).to eq([@card2,@card3, card4])
      expect(deck.high_cards).to eq([@card3])
      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end

  
end

# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3) 
# card3 = Card.new(:heart, 'Ace', 14)
