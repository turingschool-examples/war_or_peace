#Gives access to Card and Rspec
#Rspec is a unit test framework for Ruby
require './lib/card'
require './lib/deck'
require 'rspec'

#Defines a collection of Deck tests
RSpec.describe Deck do 
    describe 'initialize' do 
        it 'var deck should exist as a deck object with arg cards' do
            #Makes the var deck a Deck object with arg cards
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            #assertion
            expect(deck).to be_a(Deck)
        end

        it 'deck.cards should eq cards array' do
            #Needs access to deck var because of block scope
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            #assertion
            expect(deck.cards).to eq([card1,card2,card3])
        end

        it 'rank of card on top of the deck should equal 12' do
            #scope  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            # call a method rank_of_card_at 
            # to return the rank of the top card
            expect(deck.rank_of_card_at(0)).to eq 12
        end

        it 'rank of card on the bottom of the deck should equal 14' do
            #scope  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            # call a method rank_of_card_at 
            # to return the rank of the bottom card
            expect(deck.rank_of_card_at(2)).to eq 14
        end
          
        it 'High_ranking_cards should equal array of cards of rank>=11 ' do
            #Because of block scope  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            #Call a method called high_ranking_cards that puts cards of 
            #rank >= 11 into an array called high_ranking_cards. 
            #The method is called in the assertion below
            expect(deck.high_ranking_cards).to eq([high_ranking_cards])
        end

        xit 'percent of high_ranking_cards in the deck should equal 66.67%' do
            #Because of block scope  
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            #Calls a method called percent_high_ranking that determines the
            #percentage of high_ranking_cards in the deck
            #The method is called in the assertion below
            expect(deck.percent_high_ranking).to eq (66.67)
        end       

        # xit 'is an instance of card' do
        #     #to initialize a new card object
        #     deck = Deck.new(cards)    
        #     expect(card4) = Card.new(:club, '5', 5)
        # end   
            
        # xit 'to determine deck has cards' do
        #     #to shuffle? deck with cards?
        #     deck = Deck.new(cards)
        #     expect(deck.cards).to eq[cards]
        # end
            
        # xit 'to determine high ranking cards' do
        #     #to determine high ranking cards
        #     deck = Deck.new(cards)
        #     expect(deck.high_ranking_cards).to eq[high ranking cards]
        # end
    
        # xit 'to determine percent high ranking cards' do
        #     #to determine high ranking cards
        #     deck = Deck.new(cards)
        #     deck.percent_high_ranking 
        # end       
    end
end        