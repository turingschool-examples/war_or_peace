require './lib/card'
require './lib/deck'
require './lib/card_generator'
require 'csv'

describe CardGenerator do
    before (:each) do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:club, '8', 8)
        card3 = Card.new(:heart, '10', 10)
        card4 = Card.new(:spade, 'Ace', 14)

        @cards = [card1, card2, card3, card4]
   
        @card_generator = CardGenerator.new("test_cards.txt")
    end

    it 'exists' do
        expect(@card_generator).to be_a(CardGenerator)
    end

    it 'has readable attributes' do
        # Check if CardGenerator's card instance variable is an array to confirm it is readable
        #   Unable to check if both arrays match as the Card objects in both arrays
        #   are inherently different objects even though instance variables match
        expect(@card_generator.cards).to be_a(Array)
    end

    it 'can create deck' do
        # Loop through each CardGenerator card and example card to compare values
        #   Unable to check if both arrays match as the Card objects in both arrays
        #   are inherently different objects even though instance variables match
        @card_generator.cards.each_index do |i|
            expect(@card_generator.cards[i].rank).to eq(@cards[i].rank)
            expect(@card_generator.cards[i].value).to eq(@cards[i].value)
            expect(@card_generator.cards[i].suit).to eq(@cards[i].suit)
        end
    end
end