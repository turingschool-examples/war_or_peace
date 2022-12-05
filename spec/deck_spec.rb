require './lib/card'
require './lib/deck'

RSpec.describe Deck do 
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_a(Deck)
      expect(deck.cards).to eq(cards)
    end 
  end 

  describe '#rank of card at' do 
    it 'will return the rank of the card at index position' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
    
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end 
  end 

  describe '#high ranking cards' do 
    it 'will return an array of the high ranking cards' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
    end 
  end 

  describe '#percent high ranking cards' do 
    it 'will return a percentage of the high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards

      expect(deck.percent_high_ranking).to eq(66.67)
    end 
  end 

  describe '#remove card' do 
    it 'will remove a card from the deck' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
    
      expect(deck.remove_card).to eq(card1)
    end 
  end 

  describe '#add card' do 
    it 'will add a card to the deck' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)

      expect(deck.cards).to eq([card2, card3, card4])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(33.33)
    end 
  end 
end