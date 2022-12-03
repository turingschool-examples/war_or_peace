require 'rspec'
require './lib/card' 
require './lib/deck'

RSpec.describe do Deck 
  it 'exists and has a deck of cards' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_a(Deck)
    expect(deck.cards).to eq(cards)
  end

  describe '#rank_of_card_at' do 
    it 'will take an argument for index and return that cards rank' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do 
    it 'returns array of cards in the deck that have a rank of 11 or more' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)  
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do 
    it ' returns the percentage of cards that are high ranking' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do 
    it 'removes the top card from the deck' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards) 
      deck.remove_card 

      expect(deck.cards).to eq([card2, card3])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end 

  describe '#add_card' do 
    it 'adds one card to the bottom of the deck' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards) 

      expect(deck.cards).to eq(cards)

      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)

      expect(deck.cards).to eq([card1, card2, card3, card4])

      deck.remove_card 

      expect(deck.cards).to eq([card2, card3, card4])

      card5 = Card.new(:spade, '4', 4)
      card6 = Card.new(:diamond, 'Jack', 11)
      deck.add_card(card5)
      deck.add_card(card6)

      expect(deck.cards).to eq([card2, card3, card4, card5, card6])
    end
  end
end