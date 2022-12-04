require './lib/card'
require './lib/deck'
require 'rspec'

RSpec.describe Deck do 
    describe 'initialize' do 
        it 'The var deck should be an instance of Deck' do
            #The var deck should be a Deck object
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
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
            deck.remove_card
            expect(deck.cards).to eq([card2, card3]) 
        end

        it 'Deck of high ranking cards should have one card in the cards array' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card 
            expect(deck.high_ranking_cards).to eq([card3])
        end

        it 'Percent of high_ranking_cards in the deck should equal 50.0%' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card
            expect(deck.percent_high_ranking).to eq(50.0)
        end

        it 'var card4 should be a new Card object with 3 attributes/args' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            card4 = Card.new(:club, '5', 5)
            expect(card4).to be_an_instance_of(Card)
        end   

        it 'Deck.cards should be an array of 3 cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card 
            deck.add_card(card4)
            expect(deck.cards).to eq([card2, card3, card4])
        end
            
        it 'Deck of high_ranking_cards should be card3' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            card4 = Card.new(:club, '5', 5)
            cards = [card1, card2, card3, card4]
            deck = Deck.new(cards)
            deck.remove_card  
            expect(deck.high_ranking_cards).to eq([card3])
        end
    
        it 'Percent of high_ranking_cards in the deck should equal 33.33%' do  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5) 
            cards = [card1, card2, card3, card4]
            deck = Deck.new(cards) 
            deck.remove_card
            expect(deck.percent_high_ranking).to eq(33.33) 
        end       
    end
end        