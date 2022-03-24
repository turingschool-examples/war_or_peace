require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    before(:each) do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14)
        @card4 = Card.new(:club, '5', 5)
        @test_cards = [@card1, @card2, @card3]
        @deck = Deck.new(@test_cards) 
    end

    it 'exists' do
        expect(@deck).to be_an_instance_of(Deck)
    end

    it 'has cards' do
        expect(@deck.cards).to eq([@card1, @card2, @card3])
    end

    it 'can call rank of card' do
    
        expect(@deck.rank_of_card_at(0)).to eq 12
        expect(@deck.rank_of_card_at(2)).to eq 14
    end

    it 'can separate high ranking cards' do

        expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end

    it 'has a percentage of high ranking cards' do

        expect(@deck.percent_high_ranking).to eq(66.67)
    end

    it 'can remove cards' do

        expect(@deck.remove_card).to eq(@card1)
    end

    it 'can add cards' do 

        updated_cards = [@card1, @card2, @card3, @card4]

        expect(@deck.add_card(@card4)).to eq(updated_cards)
        expect(@deck.cards).to eq(updated_cards)
    end

end

