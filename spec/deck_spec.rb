require './lib/card'
require './lib/deck'
require 'rspec'

RSpec.describe Deck do 
    describe 'initialize' do 
        it 'var deck should be a deck object with attribute/argument cards' do
            #Makes the var deck a Deck object with arg cards
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            #assertion
            expect(deck).to be_a(Deck)
        end

        it 'deck of cards should equal array of card1,card2,card3' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card1,card2,card3])
        end

        it 'rank of card on top of the deck should equal 12' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            # call a method rank_of_card_at 
            # to return the rank of the top card
            expect(deck.rank_of_card_at(0)).to eq(12)
        end

        it 'Rank of card on the bottom of the deck should equal 14' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            # call a method rank_of_card_at 
            # to return the rank of the bottom card
            expect(deck.rank_of_card_at(2)).to eq(14)
        end
          
        it 'High_ranking_cards should equal an array of card1 and card3' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end

        it 'Percent of high_ranking cards in the deck should equal 66.67%' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end       
        
        it 'Deck.remove_card should remove and return top card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.remove_card).to eq(card1)
        end

        it 'Deck of cards should have 2 cards in the array' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card2, card3]) 
        end

        xit 'Deck of high ranking cards should have one card in the cards array' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.high_ranking_cards).to eq([card3])
        end

        
        xit 'Percent of high_ranking_cards in the deck should equal 50.0%' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(50.0)
        end

        xit 'var card4 should be a new Card object with 3 attributes/args' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3, card4]
            deck = Deck.new(cards)
            card4 = Card.new(:club, '5', 5)
            expect(card4).to eq(Card.new(:club, '5', 5))
        end   

        #Call add_card method to add card4 to the bottom of the deck
        #deck.add_card(card4)
            
        xit 'Deck.cards should be an array of cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.cards).to eq[cards array]
        end
            
        xit 'Percent of high_ranking_cards in the deck should equal 66.67%' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.high_ranking_cards).to eq([card_])
        end
    
        xit 'Percent of high_ranking_cards in the deck should equal 33.33%' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.percent_high_ranking).to eq(33.33) 
        end       
    end
end        