require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)  
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        expect(deck).to be_an_instance_of(Deck)
    end

    describe '#rank_of_card_at' do
        it 'shows rank of card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)    
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
        end
    end
    describe '#high_ranking_cards' do
        it 'shows high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)    
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end
    end
    describe 'percent_high_ranking' do
        it 'shows the percent of high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)    
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end
    end
    describe 'remove_card' do
        it 'removes first card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)    
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.remove_card).to eq(card1)
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card2, card3])
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card3])
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(50.0)
        end
         
				it '#add_card' do
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5 )
            cards = [card2, card3]
            deck = Deck.new(cards) 
            expect(deck.add_card(card4)).to eq([card2, card3, card4])
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card2, card3, card4])         
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card3])
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(33.33)
        end
    end
end