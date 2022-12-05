require './lib/card'
require './lib/deck'

describe Deck do
    before(:each) do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14)

        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards)
    end 
    describe '#initialize' do
        it 'is an instance of Deck' do
            expect(@deck).to be_a(Deck)
        end 
        it 'contains cards' do
            expect(@deck.cards).to eq([@card1, @card2, @card3])
        end
    end

    describe '#rank_of_card_at' do
        it 'identifies the rank of the card' do
            expect(@deck.rank_of_card_at(0)).to eq(12)
            expect(@deck.rank_of_card_at(2)).to eq(14)
            expect(@deck.cards).to eq([@card1, @card2, @card3])
        end 
    end 

    describe '#high_ranking_cards' do
        it 'pulls the cards ranked 11 or above' do
            expect(@deck.high_ranking_cards).to eq([@card1, @card3])
        end 
    end 

    describe '#percent_high_ranking' do
        it 'calculates the percent of high ranking cards' do
            expect(@deck.percent_high_ranking).to eq(66.67)
        end 
    end 

    describe '#remove_card' do
        it 'removes the top card and returns it' do
            expect(@deck.remove_card).to eq(@card1)
            expect(@deck.cards).to eq([@card2, @card3])
            expect(@deck.high_ranking_cards).to eq([@card3])
            expect(@deck.percent_high_ranking).to eq(50.0)
        end 
    end 

    describe '#add_card' do
        it 'adds a card to the bottom of the deck' do
            card4 = Card.new(:club, '5', 5)

            @deck.remove_card
            @deck.add_card(card4)
            
            expect(@deck.cards).to eq([@card2, @card3, card4])
            expect(@deck.high_ranking_cards).to eq([@card3])
            expect(@deck.percent_high_ranking).to eq(33.33)
        end 
    end  
end 