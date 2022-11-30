require './lib/card'
require './lib/deck'
require 'rspec'

describe Deck do 
    describe '#initailize' do 
        it 'the first card is ranked 12'do 
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        deck.cards
        
        expect(deck.rank_of_card_at(0)).to eq(12)
    end 

    it 'its opponent is ranked 14'do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    
    expect(deck.rank_of_card_at(2)).to eq(14)
    end 

    it 'it is 2/3 high ranking cards' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.high_ranking_cards

    expect(deck.percent_high_ranking).to eq(66.67) 
    end 

    end 
end 